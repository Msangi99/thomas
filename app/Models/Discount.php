<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    //use HasFactory;

    protected $table = 'discount';

    protected $fillable = [
        'code',
        'used',
        'percentage',
        'expires_at',
    ];

    protected $casts = [
        'expires_at' => 'datetime',
    ];

    /**
     * Check if the coupon is still valid (not expired and usage limit not reached).
     */
    public function isValid(): bool
    {
        if ($this->expires_at && now()->isAfter($this->expires_at)) {
            return false;
        }
        $usedCount = $this->booking()->where('payment_status', 'Paid')->count();
        return $usedCount < $this->used;
    }

    public function booking()
    {
        return $this->hasMany(Booking::class, 'discount', 'code');
    }
}
