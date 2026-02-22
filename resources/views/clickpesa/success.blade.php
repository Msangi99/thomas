@extends('layouts.app')

@section('content')
    <div class="payment-result-container">
        <div class="animated-bg">
            <div class="gradient-orb orb-1"></div>
            <div class="gradient-orb orb-2"></div>
        </div>

        <div class="result-card success">
            <div class="card-glow success"></div>

            <div class="result-header">
                <div class="icon-wrapper">
                    <div class="icon-circle success">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M9 12l2 2 4-4" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                    </div>
                </div>
                <h1 class="result-title">{{ __('all.payment_successful') ?? 'Payment Successful' }}</h1>
                <p class="result-subtitle">{{ $message ?? 'Your payment was completed successfully.' }}</p>
            </div>

            @if(isset($booking) && $booking)
            <div class="transaction-details">
                <div class="detail-row">
                    <span class="detail-label">{{ __('customer/myticket.booking_id') ?? 'Booking ID' }}</span>
                    <span class="detail-value mono">{{ $booking->booking_code ?? '—' }}</span>
                </div>
            </div>
            @endif

            <div class="action-buttons">
                <a href="{{ route('info') }}" class="btn-primary">
                    <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    {{ __('all.view_booking') ?? 'View Booking' }}
                </a>
                <a href="{{ route('home') }}" class="btn-secondary">
                    <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    {{ __('all.return_home') ?? 'Return Home' }}
                </a>
            </div>
        </div>
    </div>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap');

        :root {
            --primary: #0D9488;
            --primary-light: #14B8A6;
            --primary-dark: #0F766E;
            --bg-dark: #0A0F1C;
            --bg-card: #111827;
            --bg-elevated: #1F2937;
            --text-primary: #F9FAFB;
            --text-secondary: #9CA3AF;
            --text-muted: #6B7280;
            --border-color: rgba(255, 255, 255, 0.08);
            --success: #10B981;
            --success-light: #34D399;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        .payment-result-container {
            font-family: 'DM Sans', -apple-system, BlinkMacSystemFont, sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
            background: var(--bg-dark);
            position: relative;
            overflow: hidden;
        }

        .animated-bg { position: absolute; inset: 0; overflow: hidden; z-index: 0; }
        .gradient-orb { position: absolute; border-radius: 50%; filter: blur(80px); opacity: 0.3; }
        .orb-1 { width: 400px; height: 400px; background: linear-gradient(135deg, var(--success) 0%, #047857 100%); top: -100px; right: -100px; }
        .orb-2 { width: 300px; height: 300px; background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%); bottom: -50px; left: -50px; }

        .result-card {
            position: relative; z-index: 1; width: 100%; max-width: 440px;
            background: var(--bg-card); border-radius: 24px;
            border: 1px solid var(--border-color); overflow: hidden;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
        }

        .card-glow { position: absolute; top: 0; left: 0; right: 0; height: 2px; }
        .card-glow.success { background: linear-gradient(90deg, transparent, var(--success), var(--success-light), var(--success), transparent); }

        .result-header { padding: 2.5rem 2rem 1.5rem; text-align: center; }
        .icon-wrapper { display: inline-flex; align-items: center; justify-content: center; margin-bottom: 1.25rem; }
        .icon-circle { width: 80px; height: 80px; border-radius: 50%; display: flex; align-items: center; justify-content: center; }
        .icon-circle.success { background: linear-gradient(135deg, var(--success) 0%, #047857 100%); box-shadow: 0 10px 40px rgba(16, 185, 129, 0.4); }
        .icon-circle svg { width: 40px; height: 40px; color: white; }

        .result-title { font-size: 1.75rem; font-weight: 700; color: var(--text-primary); margin-bottom: 0.5rem; }
        .result-subtitle { font-size: 1rem; color: var(--text-secondary); }

        .transaction-details { padding: 1.5rem; }
        .detail-row { display: flex; justify-content: space-between; align-items: center; padding: 0.75rem 0; }
        .detail-label { font-size: 0.875rem; color: var(--text-muted); }
        .detail-value { font-size: 0.875rem; font-weight: 600; color: var(--text-primary); }
        .detail-value.mono { font-family: 'JetBrains Mono', monospace; font-size: 0.8rem; }

        .action-buttons { display: grid; grid-template-columns: 1fr 1fr; gap: 0.75rem; padding: 1.5rem; }
        .btn-primary, .btn-secondary {
            display: flex; align-items: center; justify-content: center; gap: 0.5rem;
            padding: 0.875rem 1rem; border-radius: 12px; font-size: 0.875rem;
            font-weight: 600; text-decoration: none; transition: all 0.2s ease;
        }
        .btn-primary { background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%); color: white; box-shadow: 0 4px 15px rgba(13, 148, 136, 0.4); }
        .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(13, 148, 136, 0.5); }
        .btn-secondary { background: var(--bg-elevated); color: var(--text-primary); border: 1px solid var(--border-color); }
        .btn-secondary:hover { background: rgba(255, 255, 255, 0.1); }
        .btn-primary svg, .btn-secondary svg { width: 18px; height: 18px; }

        @media (max-width: 480px) { .action-buttons { grid-template-columns: 1fr; } }
    </style>
@endsection
