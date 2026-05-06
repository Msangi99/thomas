<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GovernmentLevy extends Model
{
    use HasFactory;

    protected $table = 'government_levies';

    protected $fillable = [
        'campany_id',
        'booking_id',
        'amount',
    ];

    public function campany()
    {
        return $this->belongsTo(Campany::class, 'campany_id');
    }
}
