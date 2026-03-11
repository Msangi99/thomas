<?php

return [
    'enabled' => env('TRA_ENABLED', true),
    'env' => env('TRA_ENV', 'production'), // test or production
    'tin' => env('TRA_TIN', '156692506'),
    'cert_path' => env('TRA_CERT_PATH', storage_path('app/tra/10TZ101424.pfx')),
    'password' => env('TRA_PASSWORD', 'HD8v#4tN'), // PFX Password and Initial Registration Password
    'cert_serial' => env('TRA_CERT_SERIAL', '10TZ101424'), // e.g. 10TZ...
    'base_url' => [
        'test' => 'https://virtual.tra.go.tz/efdmsRctApi/api',
        'production' => 'https://vfd.tra.go.tz/api',
    ],
    'verify_url' => [
        'test' => 'https://virtual.tra.go.tz/efdmsRctVerify',
        'production' => 'https://verify.tra.go.tz',
    ],
];
