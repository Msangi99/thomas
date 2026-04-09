<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class SpecialHireOrder extends Model
{
    use HasFactory;

    protected $table = 'special_hire_orders';

    protected $fillable = [
        'order_code',
        'user_id',
        'customer_user_id',
        'coaster_id',
        'customer_name',
        'customer_phone',
        'customer_email',
        'pickup_location',
        'pickup_latitude',
        'pickup_longitude',
        'dropoff_location',
        'dropoff_latitude',
        'dropoff_longitude',
        'hire_date',
        'hire_time',
        'return_date',
        'return_time',
        'purpose',
        'passengers_count',
        'distance_km',
        'base_price',
        'price_per_km',
        'km_amount',
        'surcharge_percent',
        'surcharge_amount',
        'total_amount',
        'payment_method',
        'payment_status',
        'order_status',
        'notes',
    ];

    protected $casts = [
        'hire_date' => 'date',
        'return_date' => 'date',
        'distance_km' => 'decimal:2',
        'base_price' => 'decimal:2',
        'price_per_km' => 'decimal:2',
        'km_amount' => 'decimal:2',
        'surcharge_percent' => 'decimal:2',
        'surcharge_amount' => 'decimal:2',
        'total_amount' => 'decimal:2',
    ];

    /**
     * Boot the model.
     */
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($order) {
            if (empty($order->order_code)) {
                $order->order_code = self::generateOrderCode();
            }
        });
    }

    /**
     * Generate unique order code.
     */
    public static function generateOrderCode()
    {
        $date = Carbon::now()->format('Ymd');
        $count = self::whereDate('created_at', Carbon::today())->count() + 1;
        return 'SH-' . $date . '-' . str_pad($count, 3, '0', STR_PAD_LEFT);
    }

    /**
     * Get the user (special_hire owner) that owns this order.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the customer user account for this order.
     */
    public function customer()
    {
        return $this->belongsTo(User::class, 'customer_user_id');
    }

    /**
     * Get the coaster for this order.
     */
    public function coaster()
    {
        return $this->belongsTo(Coaster::class);
    }

    /**
     * Scope to get orders by user.
     */
    public function scopeByUser($query, $userId)
    {
        return $query->where('user_id', $userId);
    }

    /**
     * Scope to get pending orders.
     */
    public function scopePending($query)
    {
        return $query->where('order_status', 'pending');
    }

    /**
     * Scope to get confirmed orders.
     */
    public function scopeConfirmed($query)
    {
        return $query->where('order_status', 'confirmed');
    }

    /**
     * Scope to get completed orders.
     */
    public function scopeCompleted($query)
    {
        return $query->where('order_status', 'completed');
    }

    /**
     * Scope to get today's orders.
     */
    public function scopeToday($query)
    {
        return $query->whereDate('hire_date', Carbon::today());
    }

    /**
     * Scope to get paid orders.
     */
    public function scopePaid($query)
    {
        return $query->where('payment_status', 'paid');
    }

    /**
     * Check if order is pending.
     */
    public function isPending()
    {
        return $this->order_status === 'pending';
    }

    /**
     * Check if order is paid.
     */
    public function isPaid()
    {
        return $this->payment_status === 'paid';
    }

    /**
     * Get status badge color.
     */
    public function getStatusColor()
    {
        return match($this->order_status) {
            'pending' => 'yellow',
            'confirmed' => 'blue',
            'in_progress' => 'purple',
            'completed' => 'green',
            'cancelled' => 'red',
            default => 'gray',
        };
    }

    /**
     * Get payment status badge color.
     */
    public function getPaymentStatusColor()
    {
        return match($this->payment_status) {
            'pending' => 'yellow',
            'paid' => 'green',
            'refunded' => 'red',
            default => 'gray',
        };
    }

    /**
     * Ordered lifecycle steps for UI steppers (excludes terminal / side paths).
     *
     * @return list<string>
     */
    public static function orderStatusPipeline(): array
    {
        return ['pending', 'confirmed', 'in_progress', 'completed'];
    }

    /**
     * Human label for order_status.
     */
    public static function orderStatusLabel(string $status): string
    {
        return match ($status) {
            'pending' => 'Pending',
            'confirmed' => 'Confirmed',
            'in_progress' => 'In progress',
            'completed' => 'Completed',
            'cancelled' => 'Cancelled',
            default => ucfirst(str_replace('_', ' ', $status)),
        };
    }

    /**
     * Next order_status values suggested for one-click advance (linear flow + cancel).
     *
     * @return list<string>
     */
    public function allowedNextOrderStatuses(): array
    {
        if (in_array($this->order_status, ['completed', 'cancelled'], true)) {
            return [];
        }

        $pipeline = self::orderStatusPipeline();
        $idx = array_search($this->order_status, $pipeline, true);
        $next = [];
        if ($idx !== false && $idx < count($pipeline) - 1) {
            $next[] = $pipeline[$idx + 1];
        }
        if ($this->order_status !== 'cancelled') {
            $next[] = 'cancelled';
        }

        return array_values(array_unique($next));
    }

    /**
     * Index of current status in pipeline, or -1 if not in main line (e.g. cancelled).
     */
    public function orderStatusPipelineIndex(): int
    {
        $pipeline = self::orderStatusPipeline();
        $idx = array_search($this->order_status, $pipeline, true);

        return $idx === false ? -1 : (int) $idx;
    }
}

