<?php

namespace App\Http\Controllers;

use App\Models\AdminWallet;
use App\Models\Bima;
use App\Models\Booking;
use App\Models\bus;
use App\Models\PaymentFees;
use App\Models\SystemBalance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;

class AirtelPaymentController extends Controller
{
    protected $client;
    protected $baseUrl;
    protected $clientId;
    protected $clientSecret;

    public function __construct()
    {
        $this->client = new Client([
            'timeout' => 30,
            'connect_timeout' => 10,
            'http_errors' => false
        ]);

        $this->initializeConfig();
    }

    protected function initializeConfig()
    {
        try {
            $this->baseUrl = config('services.airtel.base_url');
            $this->clientId = trim(config('services.airtel.client_id'));
            $this->clientSecret = trim(config('services.airtel.client_secret'));

            if (empty($this->clientId)) {
                throw new \RuntimeException('Airtel Client ID is not configured');
            }

            if (empty($this->clientSecret)) {
                throw new \RuntimeException('Airtel Client Secret is not configured');
            }

        } catch (\Exception $e) {
            Log::critical('Airtel config initialization failed: ' . $e->getMessage());
            abort(500, 'Payment service configuration error');
        }
    }

    /**
     * Generate authentication token
     */
    protected function generateToken()
    {
        try {
            $response = $this->client->post("{$this->baseUrl}/auth/oauth2/token", [
                'headers' => [
                    'Content-Type' => 'application/x-www-form-urlencoded',
                    'Accept' => 'application/json',
                ],
                'form_params' => [
                    'client_id' => $this->clientId,
                    'client_secret' => $this->clientSecret,
                    'grant_type' => 'client_credentials',
                ],
            ]);

            $statusCode = $response->getStatusCode();
            $body = $response->getBody()->getContents();

            if ($statusCode !== 200) {
                throw new \RuntimeException("Auth failed with status {$statusCode}: {$body}");
            }

            $data = json_decode($body, true);

            if (!isset($data['access_token'])) {
                throw new \RuntimeException('Invalid auth response: missing access_token');
            }

            return $data['access_token'];

        } catch (GuzzleException $e) {
            throw new \RuntimeException('Network error during authentication: ' . $e->getMessage());
        } catch (\Exception $e) {
            throw new \RuntimeException('Authentication failed: ' . $e->getMessage());
        }
    }

    /**
     * Initiate Airtel Money payment from booking flow (called from booking/customer/vendor controllers).
     * Creates an Unpaid booking record then pushes USSD request to the customer's phone.
     */
    public function initiateBookingPayment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'amount'       => 'required|numeric|min:100',
            'phone_number' => 'required|string',
            'booking_code' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'errors' => $validator->errors()], 422);
        }

        try {
            $accessToken = $this->generateToken();
            $phoneNumber = $this->normalizePhoneNumber($request->phone_number);
            $reference   = $request->booking_code;

            $payload = [
                'reference'   => $reference,
                'subscriber'  => [
                    'country'  => 'TZ',
                    'currency' => 'TZS',
                    'msisdn'   => $phoneNumber,
                ],
                'transaction' => [
                    'amount'   => $request->amount,
                    'country'  => 'TZ',
                    'currency' => 'TZS',
                    'id'       => 'TXN_' . uniqid(),
                ],
            ];

            $response = $this->client->post("{$this->baseUrl}/merchant/v2/payments/", [
                'headers' => [
                    'Authorization' => "Bearer {$accessToken}",
                    'Content-Type'  => 'application/json',
                    'X-Country'     => 'TZ',
                    'X-Currency'    => 'TZS',
                ],
                'json' => $payload,
            ]);

            $statusCode = $response->getStatusCode();
            $body       = json_decode($response->getBody()->getContents(), true);

            if ($statusCode >= 400) {
                throw new \RuntimeException('Airtel API error: ' . ($body['message'] ?? 'Unknown'));
            }

            Log::info('Airtel booking payment initiated', [
                'booking_code' => $reference,
                'amount'       => $request->amount,
                'phone'        => $phoneNumber,
            ]);

            return response()->json(['status' => 'success', 'message' => 'Payment request sent to your Airtel number. Approve the prompt on your phone.']);

        } catch (\Exception $e) {
            Log::error('Airtel booking payment initiation failed: ' . $e->getMessage());
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * Initiate payment
     */
    public function initiatePayment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'amount' => 'required|numeric|min:100',
            'phone_number' => 'required|string',
            'reference' => 'required|string|max:50',
            'description' => 'nullable|string|max:255',
        ], [
            'phone_number.regex' => 'The phone number must be a valid Tanzanian Airtel number'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        try {
            $accessToken = $this->generateToken();
            $phoneNumber = $this->normalizePhoneNumber($request->phone_number);

            $payload = [
                'reference' => $request->reference,
                'subscriber' => [
                    'country' => 'TZ',
                    'currency' => 'TZS',
                    'msisdn' => $phoneNumber,
                ],
                'transaction' => [
                    'amount' => $request->amount,
                    'country' => 'TZ',
                    'currency' => 'TZS',
                    'id' => 'TXN_' . uniqid(),
                ],
            ];

            if ($request->has('description')) {
                $payload['transaction']['description'] = $request->description;
            }

            $response = $this->client->post("{$this->baseUrl}/merchant/v2/payments/", [
                'headers' => [
                    'Authorization' => "Bearer {$accessToken}",
                    'Content-Type' => 'application/json',
                    'X-Country' => 'TZ',
                    'X-Currency' => 'TZS',
                ],
                'json' => $payload,
            ]);

            return $this->handleApiResponse($response);

        } catch (\RuntimeException $e) {
            Log::error('Payment initiation failed: ' . $e->getMessage());
            return response()->json([
                'status' => 'error',
                'message' => 'Payment processing failed',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    protected function normalizePhoneNumber($phoneNumber)
    {
        $normalized = preg_replace('/[^0-9]/', '', $phoneNumber);
        
        // Convert to Airtel format (remove country code if present)
        if (strlen($normalized) === 12 && strpos($normalized, '255') === 0) {
            return substr($normalized, 3);
        }

        if (strlen($normalized) === 9) {
            return $normalized;
        }

        throw new \RuntimeException('Invalid phone number format');
    }

    protected function handleApiResponse($response)
    {
        $statusCode = $response->getStatusCode();
        $body = $response->getBody()->getContents();
        $data = json_decode($body, true);

        if ($statusCode >= 400) {
            $error = $data['message'] ?? $data['error'] ?? 'Unknown API error';
            throw new \RuntimeException("API request failed with status {$statusCode}: {$error}");
        }

        return response()->json([
            'status' => 'success',
            'data' => $data
        ]);
    }

    /**
     * Handle Airtel Money payment callback / webhook.
     * Settles the booking using the same commission/fee logic as all other channels.
     */
    public function paymentCallback(Request $request)
    {
        try {
            $signature = $request->header('X-Callback-Signature');
            $payload   = $request->getContent();

            if (!$this->verifyCallbackSignature($signature, $payload)) {
                throw new \RuntimeException('Invalid callback signature');
            }

            $data = json_decode($payload, true);
            if (json_last_error() !== JSON_ERROR_NONE) {
                throw new \RuntimeException('Invalid JSON payload');
            }

            $status    = $data['transaction']['status']  ?? ($data['status']    ?? null);
            $reference = $data['transaction']['id']      ?? ($data['reference'] ?? null);

            if (!$status || !$reference) {
                throw new \RuntimeException('Missing required callback parameters');
            }

            // Airtel success status code is "TS"
            if (strtoupper($status) !== 'TS' && strtolower($status) !== 'success') {
                $booking = Booking::where('booking_code', $reference)
                               ->orWhere('transaction_ref_id', $reference)
                               ->first();
                if ($booking && $booking->payment_status === 'Unpaid') {
                    $booking->update(['payment_status' => 'Failed', 'trans_status' => $status]);
                }
                return response()->json(['status' => 'received']);
            }

            $booking = Booking::where('booking_code', $reference)
                           ->orWhere('transaction_ref_id', $reference)
                           ->first();

            if (!$booking) {
                Log::error('Airtel callback: booking not found', ['reference' => $reference]);
                return response()->json(['status' => 'error', 'message' => 'Booking not found'], 404);
            }

            if ($booking->payment_status !== 'Unpaid') {
                return response()->json(['status' => 'already_processed']);
            }

            DB::beginTransaction();

            $adminWallet = AdminWallet::find(1);
            if (!$adminWallet) {
                throw new \RuntimeException('Admin wallet not found');
            }

            $vender = function ($amount, $state) use ($booking) {
                if ($booking->vender_id > 0 && $booking->vender && $booking->vender->VenderAccount) {
                    $rawPct = (float) ($booking->vender->VenderAccount->percentage ?? 0);
                    $vendorPercentage = $rawPct > 0 ? min($rawPct, 100) : PercentController::VENDOR_PERCENTAGE;
                    $vendorShare = min($amount * ($vendorPercentage / 100), max($amount, 0));
                    $booking->vender->VenderBalances->increment('amount', $vendorShare);
                    if ($state === 'fee')     { $booking->vender_fee     = $vendorShare; }
                    elseif ($state === 'service') { $booking->vender_service = $vendorShare; }
                    return $amount - $vendorShare;
                }
                return $amount;
            };

            $bimaAmount     = $booking->bima_amount ?? 0;
            $fees           = $booking->amount - $booking->busFee - $bimaAmount;
            $busOwnerAmount = $booking->busFee + (Session::get('cancel') ?? 0);

            // Government levy = 5% of bus fare (levy-inclusive → levy-exclusive base)
            $governmentLevy      = $busOwnerAmount * PercentController::GOVERNMENT_LEVY_PERCENTAGE;
            $levyExclusiveAmount = $busOwnerAmount - $governmentLevy;
            $booking->government_levy = $governmentLevy;

            $bus          = bus::with(['busname', 'route', 'campany.balance'])->find($booking->bus_id);
            $campanyModel = $bus->campany;

            // Commission Logic: Priority Percentage > Amount > Default (on levy-exclusive base)
            if ($campanyModel->percentage > 0) {
                $systemShares = $levyExclusiveAmount * ($campanyModel->percentage / 100);
            } elseif ($campanyModel->commission_amount > 0) {
                $systemShares = $campanyModel->commission_amount;
            } else {
                $systemShares = $levyExclusiveAmount * PercentController::PERCENTAGE;
            }
            $busOwnerAmount -= $systemShares;

            $systemBalanceAmount = $systemShares;
            $paymentFeesAmount   = $fees;

            if ($booking->vender_id > 0) {
                $systemBalanceAmount = $vender($systemShares, 'fee');
                $paymentFeesAmount   = $vender($fees, 'service');
            }

            if ($bimaAmount > 0) {
                Bima::create([
                    'booking_id' => $booking->id,
                    'start_date' => $booking->travel_date,
                    'end_date'   => $booking->insuranceDate,
                    'amount'     => $bimaAmount,
                    'bima_vat'   => $bimaAmount * (18 / 118),
                ]);
                $adminWallet->increment('balance', $bimaAmount);
            }

            $booking->update([
                'payment_status'  => 'Paid',
                'trans_status'    => 'success',
                'trans_token'     => $reference,
                'fee'             => $systemBalanceAmount,
                'service'         => $paymentFeesAmount,
                'fee_vat'         => $booking->fee_vat ?? 0,
                'service_vat'     => $booking->service_vat ?? 0,
                'vender_fee'      => $booking->vender_fee ?? 0,
                'vender_service'  => $booking->vender_service ?? 0,
                'government_levy' => $booking->government_levy ?? 0,
                'amount'          => $busOwnerAmount,
                'payment_method'  => 'airtel',
            ]);

            SystemBalance::create(['campany_id' => $bus->campany->id, 'balance' => $systemBalanceAmount]);
            $adminWallet->increment('balance', $systemBalanceAmount);

            PaymentFees::create(['campany_id' => $bus->campany->id, 'amount' => $paymentFeesAmount, 'booking_id' => $booking->booking_code]);
            $adminWallet->increment('balance', $paymentFeesAmount);

            $bus->campany->balance->increment('amount', $busOwnerAmount);

            DB::commit();

            Log::info('Airtel payment settled', [
                'booking_code'    => $booking->booking_code,
                'bus_owner_share' => $busOwnerAmount,
                'commission'      => $systemBalanceAmount,
                'service_fees'    => $paymentFeesAmount,
                'govt_levy'       => $governmentLevy,
            ]);

            return response()->json(['status' => 'success']);

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Airtel callback settlement failed: ' . $e->getMessage());
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    protected function verifyCallbackSignature($signature, $payload)
    {
        $secret = config('services.airtel.callback_secret');
        
        if (empty($secret)) {
            Log::warning('Callback secret not configured - signature verification skipped');
            return true;
        }

        $expectedSignature = hash_hmac('sha256', $payload, $secret);
        return hash_equals($expectedSignature, $signature);
    }
}