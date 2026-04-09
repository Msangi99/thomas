<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SpecialHireWithdrawalRequest extends Model
{
    protected $table = 'special_hire_withdrawal_requests';

    protected $fillable = [
        'user_id',
        'amount',
        'payment_method',
        'payment_number',
        'notes',
        'status',
        'admin_note',
        'processed_at',
    ];

    protected $casts = [
        'amount' => 'decimal:2',
        'processed_at' => 'datetime',
    ];

    public const STATUS_PENDING = 'pending';

    public const STATUS_APPROVED = 'approved';

    public const STATUS_REJECTED = 'rejected';

    public const STATUS_PAID = 'paid';

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function scopeForUser($query, int $userId)
    {
        return $query->where('user_id', $userId);
    }

    public function scopePending($query)
    {
        return $query->where('status', self::STATUS_PENDING);
    }

    /**
     * Not finished: waiting on admin (pending) or approved but not yet marked paid.
     */
    public function scopeAwaitingAction($query)
    {
        return $query->whereIn('status', [self::STATUS_PENDING, self::STATUS_APPROVED]);
    }

    /**
     * Finished: paid out or rejected.
     */
    public function scopeExecuted($query)
    {
        return $query->whereIn('status', [self::STATUS_PAID, self::STATUS_REJECTED]);
    }

    /**
     * Requests awaiting admin action (not yet paid out or rejected).
     */
    public static function reservedAmountForUser(int $userId): float
    {
        return (float) self::query()
            ->where('user_id', $userId)
            ->whereIn('status', [self::STATUS_PENDING, self::STATUS_APPROVED])
            ->sum('amount');
    }

    /**
     * Completed payouts to the operator.
     */
    public static function paidOutAmountForUser(int $userId): float
    {
        return (float) self::query()
            ->where('user_id', $userId)
            ->where('status', self::STATUS_PAID)
            ->sum('amount');
    }

    /**
     * Paid hire revenue minus all non-rejected withdrawal amounts (pending, approved, or already paid out).
     */
    public static function withdrawableForUser(int $userId): float
    {
        $paid = (float) SpecialHireOrder::byUser($userId)->paid()->sum('total_amount');
        $allocated = (float) self::query()
            ->where('user_id', $userId)
            ->whereIn('status', [self::STATUS_PENDING, self::STATUS_APPROVED, self::STATUS_PAID])
            ->sum('amount');

        return max(0, $paid - $allocated);
    }
}
