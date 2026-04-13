<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;

class Coaster extends Model
{
    use HasFactory;

    public const IMAGE_DISK = 'public';

    public const IMAGE_DIRECTORY = 'coasters';

    protected $table = 'coasters';

    protected $fillable = [
        'user_id',
        'driver_user_id',
        'name',
        'plate_number',
        'capacity',
        'model',
        'color',
        'status',
        'image',
        'driver_name',
        'driver_contact',
        'latitude',
        'longitude',
        'last_location_update',
        'features',
    ];

    protected $casts = [
        'latitude' => 'decimal:8',
        'longitude' => 'decimal:8',
        'last_location_update' => 'datetime',
    ];

    /**
     * The accessors to append to the model's array form.
     */
    protected $appends = ['image_url'];

    /**
     * Get the full URL for the coaster image.
     */
    public function getImageUrlAttribute(): ?string
    {
        if (!$this->image) {
            return null;
        }
        if (! Storage::disk(self::IMAGE_DISK)->exists($this->image)) {
            return null;
        }

        return Storage::disk(self::IMAGE_DISK)->url($this->image);
    }

    /**
     * Persist an uploaded coaster image to the public disk (storage/app/public/coasters).
     *
     * @throws \RuntimeException
     */
    public static function storeCoasterImageFile(UploadedFile $file): string
    {
        $disk = Storage::disk(self::IMAGE_DISK);
        if (! $disk->exists(self::IMAGE_DIRECTORY)) {
            $disk->makeDirectory(self::IMAGE_DIRECTORY);
        }
        $path = $file->store(self::IMAGE_DIRECTORY, self::IMAGE_DISK);
        if (! is_string($path) || $path === '') {
            throw new \RuntimeException('The server could not save the image file.');
        }

        return $path;
    }

    /**
     * Get the user (special_hire owner) that owns the coaster.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the driver user account for this coaster.
     */
    public function driver()
    {
        return $this->belongsTo(User::class, 'driver_user_id');
    }

    /**
     * Get the orders for this coaster.
     */
    public function orders()
    {
        return $this->hasMany(SpecialHireOrder::class);
    }

    /**
     * Get the pricing for this coaster.
     */
    public function pricing()
    {
        return $this->hasOne(SpecialHirePricing::class);
    }

    /**
     * Scope to get available coasters.
     */
    public function scopeAvailable($query)
    {
        return $query->where('status', 'available');
    }

    /**
     * Exclude coasters that already have an active hire (in progress, or pending/confirmed
     * with hire window ending today or later). Used for public “available vehicles” list.
     */
    public function scopeWithoutActiveHireSchedule($query)
    {
        $today = Carbon::today()->toDateString();

        return $query->whereDoesntHave('orders', function ($q) use ($today) {
            $q->whereIn('order_status', ['pending', 'confirmed', 'in_progress'])
                ->where(function ($w) use ($today) {
                    $w->where('order_status', 'in_progress')
                        ->orWhereRaw('COALESCE(return_date, hire_date) >= ?', [$today]);
                });
        });
    }

    /**
     * True if another order overlaps the inclusive hire window [rangeStart, rangeEnd].
     */
    public function hasHireScheduleConflict(Carbon $rangeStart, Carbon $rangeEnd, ?int $ignoreOrderId = null): bool
    {
        $rs = $rangeStart->toDateString();
        $re = $rangeEnd->toDateString();

        $q = $this->orders()
            ->whereIn('order_status', ['pending', 'confirmed', 'in_progress'])
            ->whereRaw('hire_date <= ? AND COALESCE(return_date, hire_date) >= ?', [$re, $rs]);

        if ($ignoreOrderId !== null) {
            $q->where('id', '!=', $ignoreOrderId);
        }

        return $q->exists();
    }

    /**
     * Scope to get coasters by user.
     */
    public function scopeByUser($query, $userId)
    {
        return $query->where('user_id', $userId);
    }

    /**
     * Check if coaster is available.
     */
    public function isAvailable()
    {
        return $this->status === 'available';
    }

    /**
     * Check if coaster is on hire.
     */
    public function isOnHire()
    {
        return $this->status === 'on_hire';
    }

    /**
     * Update coaster location.
     */
    public function updateLocation($latitude, $longitude)
    {
        $this->update([
            'latitude' => $latitude,
            'longitude' => $longitude,
            'last_location_update' => now(),
        ]);
    }
}

