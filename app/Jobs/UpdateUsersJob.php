<?php

namespace App\Jobs;

use App\Http\Controllers\SmsController;
use App\Mail\UpdateUsersMail;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class UpdateUsersJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    public $booking;
    public function __construct($booking)
    {
        $this->booking = $booking;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        // Check if email notifications are enabled
        $settings = \App\Models\Setting::first();
        $sendEmail = $settings ? (bool) ($settings->enable_customer_email_notifications ?? true) : true;

        if (!$sendEmail || empty($this->booking->customer_email)) {
            return;
        }

        try {
            Mail::to($this->booking->customer_email)->send(new UpdateUsersMail($this->booking));
        } catch (\Exception $e) {
            \Illuminate\Support\Facades\Log::error("Failed to send update email in job: " . $e->getMessage(), [
                'booking_id' => $this->booking->id ?? null,
                'customer_email' => $this->booking->customer_email,
            ]);
            // Don't throw exception to prevent job retries
        }
    }
}
