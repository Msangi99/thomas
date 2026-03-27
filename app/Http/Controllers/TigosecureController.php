<?php

namespace App\Http\Controllers;

use App\Models\route;
use Exception;

class TigosecureController extends Controller
{
    private $client_id;
    private $client_secret;

    public function __construct()
    {
        $this->client_id = "FohxYSyTZmAIqMxXqJKUWhZWYx7021KU"; // Your Key
        $this->client_secret = "FfEYvf8juaRfsER3"; // Your Secret
    }

    private function generateAccessToken()
    {
        $url = "https://secure.tigo.com/v1/oauth/generate/accesstoken?grant_type=client_credentials";

        $headers = ["Content-Type: application/x-www-form-urlencoded"];

        $data = [
            "client_id" => $this->client_id,
            "client_secret" => $this->client_secret,
        ];

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));

        $response = curl_exec($ch);
        $httpCode = (int) curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlErrno = curl_errno($ch);
        $curlError = curl_error($ch);
        curl_close($ch);

        if ($response === false) {
            throw new Exception(
                "Tigo OAuth: curl request failed (errno {$curlErrno}): {$curlError}"
            );
        }

        $raw = (string) $response;
        $trimmed = trim($raw);

        if ($trimmed === '') {
            throw new Exception(
                "Tigo OAuth: empty response from server (HTTP {$httpCode}). Check network, firewall, or SSL to secure.tigo.com."
            );
        }

        $result = json_decode($trimmed, true);
        $jsonErr = json_last_error();

        if ($jsonErr !== JSON_ERROR_NONE) {
            $preview = strlen($trimmed) > 2000 ? substr($trimmed, 0, 2000) . '…' : $trimmed;

            throw new Exception(
                "Tigo OAuth: response is not valid JSON (HTTP {$httpCode}). " . json_last_error_msg() . ". Raw body: {$preview}"
            );
        }

        if ($result === null) {
            $preview = strlen($trimmed) > 500 ? substr($trimmed, 0, 500) . '…' : $trimmed;

            throw new Exception(
                "Tigo OAuth: JSON decoded to null (HTTP {$httpCode}). Raw: {$preview}"
            );
        }

        if (isset($result["accessToken"])) {
            return $result["accessToken"];
        }

        $encoded = json_encode($result, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

        throw new Exception(
            "Tigo OAuth: no accessToken in JSON (HTTP {$httpCode}). API body: {$encoded}"
        );
    }

    private function generateRandomId()
    {
        $characters = "abcdefghijklmnopqrstuvwxyz0123456789";
        $randomString = "";
        for ($i = 0; $i < 8; $i++) {
            $randomString .= $characters[rand(0, strlen($characters) - 1)];
        }

        $randomNumber = rand(100, 999);

        return $randomString . "-" . $randomNumber;
    }

    public function payment($postedData)
    {
        try {
            $accessToken = $this->generateAccessToken();

            $transactionRefId = $this->generateRandomId();

            $paymentDetails = [
                "MasterMerchant" => [
                    "account" => "25565311977",
                    "pin" => "1977",
                    "id" => "HIGHLINK ISGC"
                ],
                "Subscriber" => [
                    "account" => $postedData['account'],
                    "countryCode" => $postedData['countryCode'],
                    "country" => $postedData['country'],
                    "firstName" => $postedData['firstName'],
                    "lastName" => $postedData['lastName'],
                    "emailId" => $postedData['email']
                ],
                "redirectUri" => route('tigo.redirect', ['transactionRefId' => $transactionRefId]),
                "callbackUri" => route('tigo.callback'),
                "language" => "eng",
                "terminalId" => "",
                "originPayment" => [
                    "amount" => $postedData['amount'],
                    "currencyCode" => $postedData['currency'],
                    "tax" => "0.00",
                    "fee" => "0.00"
                ],
                "exchangeRate" => "1",
                "LocalPayment" => [
                    "amount" => $postedData['amount'],
                    "currencyCode" => $postedData['currency']
                ],
                "transactionRefId" => $transactionRefId
            ];

            $url = "https://secure.tigo.com/v1/tigo/payment-auth/authorize";

            $headers = [
                "Content-Type: application/json",
                "accessToken: " . $accessToken,
            ];

            $ch = curl_init($url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($paymentDetails));

            $response = curl_exec($ch);

            if ($response === false) {
                throw new Exception("Curl error: " . curl_error($ch));
            }

            curl_close($ch);

            $result = json_decode($response, true);

            if (isset($result["redirectUrl"])) {
                return [
                    'transactionRefId' => $transactionRefId,
                    'redirectUrl' => $result["redirectUrl"]
                ];
            }

            throw new Exception("Payment authorization failed: " . json_encode($result));
        } catch (Exception $e) {
            throw new Exception("Error: " . $e->getMessage());
        }
    }

    public function testToken()
    {
        try {
            $token = $this->generateAccessToken();

            return response()->json([
                'status' => 'success',
                'accessToken' => $token,
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
            ], 500);
        }
    }
    
}
?>