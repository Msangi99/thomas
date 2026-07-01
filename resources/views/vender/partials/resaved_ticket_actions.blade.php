<div class="ticket-actions">
    <form action="{{ route('vender.edit.resaved', ['id' => $book->id]) }}" method="get">
        @csrf
        <button type="submit" class="ticket-action-btn ticket-action-btn--success" title="{{ __('all.edit_title') }}">
            <i class="fas fa-pen"></i>
        </button>
    </form>

    <form action="{{ route('vender.cancel.resaved', ['id' => $book->id]) }}" method="POST"
        onsubmit="return confirm(@json(__('vender/resaved_tickets.cancel_confirm')))">
        @csrf
        <button type="submit" class="ticket-action-btn ticket-action-btn--danger" title="{{ __('all.cancel_title') }}">
            <i class="fas fa-times"></i>
        </button>
    </form>

    <form action="{{ route('vender.pay.resaved', ['id' => $book->id]) }}" method="get">
        @csrf
        <button type="submit" class="ticket-action-btn ticket-action-btn--primary" title="{{ __('all.pay_button') }}">
            <i class="fas fa-credit-card"></i>
        </button>
    </form>
</div>
