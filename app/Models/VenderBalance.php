<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VenderBalance extends Model
{
    //use HasFactory;

    protected $table = 'vender_balances';

    protected $fillable = [
        'user_id',
        'amount',
        'sell_cash_amount',
        'fees',
        'payment_number',
    ];

    protected $casts = [
        'amount' => 'decimal:2',
        'sell_cash_amount' => 'decimal:2',
        'fees' => 'decimal:2',
    ];

    
    public function user()
    {
        return $this->hasOne(User::class);
    }
}
