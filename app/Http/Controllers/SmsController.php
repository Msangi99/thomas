<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class SmsController extends Controller
{
    /**
     * Send SMS via external API. Handles network/API errors without throwing.
     *
     * @param string $destination Phone number
     * @param string $message Message text
     * @return string|false Message ID on success, false on failure
     */
    public function sms_send($destination, $message)
    {
        $username = "HIGHLINK";
        $password = "ifxcs1ud";
        $senderid = "HIGHLINK";
        $message = urlencode($message);
        $url = "https://www.sms.co.tz/api.php?do=sms&username={$username}&password={$password}&senderid={$senderid}&dest={$destination}&msg={$message}";

        $fetch = @file_get_contents($url);

        if ($fetch === false) {
            Log::warning('SMS API request failed', [
                'destination' => $destination,
                'url' => preg_replace('/password=[^&]+/', 'password=***', $url),
            ]);
            return false;
        }

        $result = explode(",", $fetch);
        $result_status = $result[0] ?? '';
        $result_status_detail = $result[1] ?? 'Unknown';

        if ($result_status === "OK") {
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
