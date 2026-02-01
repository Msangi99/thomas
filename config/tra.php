<?php

return [
    'env' => env('TRA_ENV', 'test'), // test or production
    'tin' => env('TRA_TIN', '123456789'),
    'cert_path' => env('TRA_CERT_PATH', storage_path('app/tra/certificate.pfx')),
    'password' => env('TRA_PASSWORD', ''), // PFX Password and Initial Registration Password
    'cert_serial' => env('TRA_CERT_SERIAL', ''), // e.g. 10TZ...
    'base_url' => [
        'test' => 'https://virtual.tra.go.tz/efdmsRctApi/api',
        'production' => 'https://vfd.tra.go.tz/api',
    ],
    'verify_url' => [
        'test' => 'https://virtual.tra.go.tz/efdmsRctVerify',
        'production' => 'https://verify.tra.go.tz',
    ],
];
