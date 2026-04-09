<?php

return [
    /*
    |--------------------------------------------------------------------------
    | TRA Electronic Fiscal Device (VFD) — Tanzania
    |--------------------------------------------------------------------------
    |
    | Error "Missing Cert-Serial Header or provided certificate not found" means:
    | 1) TRA_CERT_PATH must be the exact .pfx issued to you for this TIN (production vs test).
    | 2) TRA_CERT_SERIAL must match the EFD serial on that certificate (same as TRA portal).
    | 3) TRA_ENV must match where that cert is registered (production: vfd.tra.go.tz).
    | 4) If auto header still fails, set TRA_CERT_SERIAL_HEADER_BASE64 to the value TRA gave you.
    | 5) After changing TIN, env, or certificate, delete storage/app/tra/state.json once.
    |
    | Set TRA_ENABLED=false to process payments without fiscalization until TRA is fixed.
    |
    */
    'enabled' => env('TRA_ENABLED', true),

    'env' => env('TRA_ENV', 'production'), // test or production
    'tin' => env('TRA_TIN', ''),
    'cert_path' => env('TRA_CERT_PATH', storage_path('app/tra/certificate.pfx')),
    'password' => env('TRA_PASSWORD'),
    // EFD serial string (CERTKEY in registration XML), e.g. 10TZ… — must match the .pfx file
    'cert_serial' => env('TRA_CERT_SERIAL', ''),

    // Paste exact base64 Cert-Serial header from TRA integration docs if server still rejects
    'cert_serial_header_base64' => env('TRA_CERT_SERIAL_HEADER_BASE64'),
    'base_url' => [
        'test' => 'https://virtual.tra.go.tz/efdmsRctApi/api',
        'production' => 'https://vfd.tra.go.tz/api',
    ],
    'verify_url' => [
        'test' => 'https://virtual.tra.go.tz/efdmsRctVerify',
        'production' => 'https://verify.tra.go.tz',
    ],
];
