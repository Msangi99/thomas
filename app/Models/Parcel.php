<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Parcel extends Model
{
    protected $fillable = [
        'parcel_number',
        'parcel_type',
        'description',
        'amount_paid',
        'bus_id',
        'vender_id',
    ];

    public function bus()
    {
        return $this->belongsTo(bus::class);
    }

    public function vender()
    {
        return $this->belongsTo(User::class, 'vender_id');
    }
}
