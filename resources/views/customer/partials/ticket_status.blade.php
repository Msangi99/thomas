@if ($book->payment_status == 'Paid')
    <span class="page-badge page-badge--paid">{{ __('customer/myticket.Paid') }}</span>
@elseif($book->payment_status == 'Unpaid')
    <span class="page-badge page-badge--unpaid">{{ __('customer/myticket.Unpaid') }}</span>
@elseif ($book->payment_status == 'resaved')
    <span class="page-badge page-badge--resaved">{{ __('customer/busroot.resaved_ticket') }}</span>
@elseif ($book->payment_status == 'Cancel')
    <span class="page-badge page-badge--cancel">Cancel</span>
@elseif ($book->payment_status == 'Refund')
    <span class="page-badge page-badge--refund">{{ __('customer/myticket.Refund') }}</span>
@elseif (in_array($book->payment_status, ['Refund Pending', 'refunded']))
    <span class="page-badge page-badge--pending">{{ __('customer/myticket.Refund_pending') }}</span>
@elseif ($book->payment_status == 'Refund Rejected')
    <span class="page-badge page-badge--cancel">{{ __('customer/myticket.Refund_rejected') }}</span>
@else
    <span class="page-badge page-badge--failed">{{ __('customer/myticket.Failed') }}</span>
@endif
