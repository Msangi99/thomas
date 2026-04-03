<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Log;

class SmsController extends Controller
{
    /**
     * Send SMS via external API. Handles network/API errors without throwing.
     *
     * @param string|null $destination Phone number (255… or local digits)
     * @param string $message Message text
     * @return string|false Message ID on success, false on failure
     */
    public function sms_send($destination, $message)
    {
        $destination = preg_replace('/[^0-9]/', '', (string) $destination);
        if ($destination === '' || strlen($destination) < 9) {
            Log::warning('SMS skipped: invalid or empty destination', [
                'destination_raw' => $destination,
            ]);
            return false;
        }

        $sms = config('services.sms', []);
        $username = $sms['username'] ?? 'HIGHLINK';
        $password = $sms['password'] ?? '';
        $senderid = $sms['sender_id'] ?? 'HIGHLINK';

        $messageEnc = urlencode($message);
        $url = 'https://www.sms.co.tz/api.php?do=sms&username=' . rawurlencode($username)
            . '&password=' . rawurlencode($password)
            . '&senderid=' . rawurlencode($senderid)
            . '&dest=' . rawurlencode($destination)
            . '&msg=' . $messageEnc;

        $fetch = @file_get_contents($url);

        if ($fetch === false) {
            Log::warning('SMS API request failed', [
                'destination' => $destination,
                'url' => preg_replace('/password=[^&]+/', 'password=***', $url),
            ]);
            return false;
        }

        $result = explode(',', $fetch);
        $result_status = $result[0] ?? '';
        $result_status_detail = $result[1] ?? 'Unknown';

        if ($result_status === 'OK') {
            $result_id = $result[2] ?? '';

            return $result_id;
        }

        Log::info('SMS API returned error', [
            'destination' => $destination,
            'status' => $result_status_detail,
        ]);

        return false;
    }
}
