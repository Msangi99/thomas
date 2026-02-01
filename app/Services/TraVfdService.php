<?php

namespace App\Services;

use App\Models\Booking;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;
use SimpleXMLElement;
use Exception;

class TraVfdService
{
    protected $env;
    protected $baseUrl;
    protected $tin;
    protected $certSerial;
    protected $password;
    protected $certPath;

    protected $stateFile = 'tra/state.json';

    public function __construct()
    {
        $this->env = config('tra.env', 'test');
        $this->tin = config('tra.tin');
        $this->certSerial = config('tra.cert_serial');
        $this->password = config('tra.password');
        $this->certPath = config('tra.cert_path');

        $this->baseUrl = $this->env === 'production'
            ? 'https://vfd.tra.go.tz/api'
            : 'https://virtual.tra.go.tz/efdmsRctApi/api';
    }

    /**
     * Main entry point to fiscalize a booking
     */
    public function fiscalize(Booking $booking)
    {
        try {
            if ($booking->tra_status === 'success') {
                return true; // Already fiscalized
            }

            // 1. Ensure we have valid token and config
            $this->ensureAuthenticated();

            // 2. Prepare Receipt Data
            $state = $this->getState();
            $rctNum = $state['gc'] + 1; // Increment Global Counter
            $dc = $this->getDailyCounter($state);

            // 3. Construct XML
            $xml = $this->buildReceiptXml($booking, $state, $rctNum, $dc);

            // 4. Sign Payload
            $signedXml = $this->signPayload($xml, 'RCT');

            // 5. Send to TRA
            $response = $this->sendReceiptRequest($signedXml, $state);

            // 6. Process Response
            return $this->handleReceiptResponse($response, $booking, $state, $rctNum, $dc);

        } catch (Exception $e) {
            Log::error("TRA Fiscalization Error (Booking {$booking->id}): " . $e->getMessage());
            $booking->update(['tra_status' => 'failed', 'tra_error' => $e->getMessage()]);
            return false;
        }
    }

    // --- Authentication & State Management ---

    protected function ensureAuthenticated()
    {
        $state = $this->getState();

        // If not registered, register first
        if (empty($state['username'])) {
            $this->register();
            $state = $this->getState(); // Reload state
        }

        // Check Token Expiry
        if (empty($state['token']) || $state['token_expires_at'] < time()) {
            $this->requestToken($state);
        }
    }

    protected function register()
    {
        $payload = "<REGDATA><TIN>{$this->tin}</TIN><CERTKEY>{$this->certSerial}</CERTKEY></REGDATA>";
        $signature = $this->signData($payload);

        $xml = "<?xml version='1.0' encoding='UTF-8'?><EFDMS><REGDATA><TIN>{$this->tin}</TIN><CERTKEY>{$this->certSerial}</CERTKEY></REGDATA><EFDMSSIGNATURE>{$signature}</EFDMSSIGNATURE></EFDMS>";

        $url = $this->env === 'production' ? 'https://vfd.tra.go.tz/api/vfdRegReq' : 'https://virtual.tra.go.tz/efdmsRctApi/api/vfdRegReq';

        Log::info("TRA Registration Request to $url");

        $response = Http::withHeaders([
            'Content-Type' => 'application/xml',
            'Cert-Serial' => base64_encode($this->getCertSerialHex()), // Needs hex converted to base64? The doc says "Serial of the Key certificate... open certificate file and look for serial number". "Should be base64 encoded."
            'Client' => 'WEBAPI'
        ])->send('POST', $url, ['body' => $xml]);

        if ($response->failed()) {
            throw new Exception("Registration HTTP Failed: " . $response->body());
        }

        $xmlResp = simplexml_load_string($response->body());
        if ((string) $xmlResp->EFDMSRESP->ACKCODE !== '0') {
            throw new Exception("Registration API Failed: " . (string) $xmlResp->EFDMSRESP->ACKMSG);
        }

        // Save Registration Data
        $data = $xmlResp->EFDMSRESP;
        $this->updateState([
            'username' => (string) $data->USERNAME,
            'password' => (string) $data->PASSWORD, // API pwd
            'receipt_code' => (string) $data->RECEIPTCODE,
            'routing_key' => (string) $data->ROUTINGKEY,
            'reg_id' => (string) $data->REGID,
            'gc' => (int) $data->GC,
            'registered_at' => now()->toIso8601String()
        ]);

        Log::info("TRA Registration Successful");
    }

    protected function requestToken($state)
    {
        $url = $this->env === 'production' ? 'https://vfd.tra.go.tz/vfdtoken' : 'https://virtual.tra.go.tz/efdmsRctApi/vfdtoken';

        $response = Http::asForm()->post($url, [
            'username' => $state['username'],
            'password' => $state['password'],
            'grant_type' => 'password'
        ]);

        if ($response->failed()) {
            throw new Exception("Token Request Failed: " . $response->body());
        }

        $data = $response->json();
        if (!isset($data['access_token'])) {
            throw new Exception("Token not found in response");
        }

        $this->updateState([
            'token' => $data['access_token'],
            'token_expires_at' => time() + ($data['expires_in'] ?? 3600) - 60 // Buffer
        ]);
    }

    // --- Receipt Construction ---

    protected function buildReceiptXml(Booking $booking, $state, $rctNum, $dc)
    {
        $date = date('Y-m-d');
        $time = date('H:i:s');
        $znum = date('Ymd');

        $custIdType = '1'; // TIN
        $custId = $booking->customer_phone ?? '000000000'; // Fallback
        $custName = htmlspecialchars($booking->customer_name ?? 'Costumer');
        $mobile = $this->normalizePhone($booking->customer_phone);

        $rctVNum = $state['receipt_code'] . $rctNum; // Verification Num: CODE + GC

        $amount = number_format($booking->amount, 2, '.', '');
        $taxCode = '1'; // Standard Rate 18% - Adjust logic if needed (e.g. buses might be exempt?)
        // Calculate Net and Tax based on 18%
        // Gross = Net * 1.18 -> Net = Gross / 1.18
        $net = number_format($amount / 1.18, 2, '.', '');
        $tax = number_format($amount - $net, 2, '.', '');

        $xml = "<RCT><DATE>$date</DATE><TIME>$time</TIME><TIN>{$this->tin}</TIN><REGID>{$state['reg_id']}</REGID><EFDSERIAL>{$this->certSerial}</EFDSERIAL><CUSTIDTYPE>$custIdType</CUSTIDTYPE><CUSTID>$custId</CUSTID><CUSTNAME>$custName</CUSTNAME><MOBILENUM>$mobile</MOBILENUM><RCTNUM>$rctNum</RCTNUM><DC>$dc</DC><GC>$rctNum</GC><ZNUM>$znum</ZNUM><RCTVNUM>$rctVNum</RCTVNUM><ITEMS><ITEM><ID>1</ID><DESC>Transport Ticket {$booking->booking_code}</DESC><QTY>1</QTY><TAXCODE>$taxCode</TAXCODE><AMT>$amount</AMT></ITEM></ITEMS><TOTALS><TOTALTAXEXCL>$net</TOTALTAXEXCL><TOTALTAXINCL>$amount</TOTALTAXINCL><DISCOUNT>0.00</DISCOUNT></TOTALS><PAYMENTS><PMTTYPE>EMONEY</PMTTYPE><PMTAMOUNT>$amount</PMTAMOUNT></PAYMENTS><VATTOTALS><VATRATE>A</VATRATE><NETTAMOUNT>$net</NETTAMOUNT><TAXAMOUNT>$tax</TAXAMOUNT></VATTOTALS></RCT>";

        return $xml;
    }

    protected function sendReceiptRequest($signedXml, $state)
    {
        $url = "{$this->baseUrl}/efdmsRctInfo";

        $details = $this->getCertDetails();
        // Extract Serial in Hex form correctly
        $certSerialHex = $details['serialNumberHex'] ?? $this->getCertSerialHex();

        $response = Http::withHeaders([
            'Content-Type' => 'application/xml',
            'Routing-Key' => $state['routing_key'],
            'Cert-Serial' => base64_encode(hex2bin($certSerialHex)), // The doc example uses base64 of the HEX BYTES
            'Client' => 'WEBAPI',
            'Authorization' => 'Bearer ' . $state['token']
        ])->send('POST', $url, ['body' => $signedXml]);

        return $response;
    }

    protected function handleReceiptResponse($response, $booking, $state, $rctNum, $dc)
    {
        if ($response->failed()) {
            throw new Exception("Receipt API HTTP Error: " . $response->body());
        }

        $xml = simplexml_load_string($response->body());
        $ackCode = (string) $xml->RCTACK->ACKCODE;

        if ($ackCode === '0') {
            // Success
            $this->updateState([
                'gc' => $rctNum, // Confirm GC increment
                'last_dc' => $dc,
                'last_znum' => date('Ymd')
            ]);

            $rctVNum = $state['receipt_code'] . $rctNum;

            // Build QR Link
            $verifyBase = config('tra.verify_url.' . $this->env);
            $timeStr = date('His');
            $qrUrl = "$verifyBase/{$rctVNum}_{$timeStr}";

            $booking->update([
                'tra_status' => 'success',
                'tra_rct_num' => $rctNum,
                'tra_z_num' => date('Ymd'),
                'tra_vnum' => $rctVNum,
                'tra_qr_url' => $qrUrl,
                'tra_response' => $response->body()
            ]);

            Log::info("TRA Receipt Success for Booking {$booking->id}");
            return true;
        } else {
            // Logic Error from TRA
            $msg = (string) $xml->RCTACK->ACKMSG;
            Log::warning("TRA Receipt Rejected (Booking {$booking->id}): $msg");
            $booking->update(['tra_status' => 'rejected', 'tra_error' => $msg]);
            return false;
        }
    }

    // --- Helper Functions ---

    protected function signPayload($xmlContent, $tag = 'RCT')
    {
        $signature = $this->signData($xmlContent);

        $wrapped = "<?xml version='1.0' encoding='UTF-8'?><EFDMS>$xmlContent<EFDMSSIGNATURE>$signature</EFDMSSIGNATURE></EFDMS>";
        return $wrapped;
    }

    protected function signData($data)
    {
        $certs = $this->getCertDetails();
        $privateKey = $certs['pkey'];

        openssl_sign($data, $signature, $privateKey, OPENSSL_ALGO_SHA1);
        return base64_encode($signature);
    }

    protected function getCertDetails()
    {
        if (!file_exists($this->certPath)) {
            throw new Exception("Certificate file not found at: " . $this->certPath);
        }

        $certStore = file_get_contents($this->certPath);
        if (!openssl_pkcs12_read($certStore, $certInfo, $this->password)) {
            throw new Exception("Failed to read certificate. Check password.");
        }

        return $certInfo;
    }

    protected function getCertSerialHex()
    {
        // This is tricky. The doc says "Serial of the Key certificate to be provided by TRA".
        // Often we extract it from the Cert.
        $details = $this->getCertDetails();
        $cert = openssl_x509_parse($details['cert']);
        return $cert['serialNumberHex'];
    }

    protected function getState()
    {
        if (Storage::exists($this->stateFile)) {
            return json_decode(Storage::get($this->stateFile), true);
        }
        return ['gc' => 0];
    }

    protected function updateState($updates)
    {
        $state = $this->getState();
        $newState = array_merge($state, $updates);
        Storage::put($this->stateFile, json_encode($newState, JSON_PRETTY_PRINT));
    }

    protected function getDailyCounter($state)
    {
        $today = date('Ymd');
        if (($state['last_znum'] ?? '') !== $today) {
            return 1; // Reset DC for new day
        }
        return ($state['last_dc'] ?? 0) + 1;
    }

    protected function normalizePhone($phone)
    {
        $phone = preg_replace('/[^0-9]/', '', $phone);
        if (strlen($phone) === 10 && strpos($phone, '0') === 0) {
            return '255' . substr($phone, 1);
        }
        return $phone;
    }
}
