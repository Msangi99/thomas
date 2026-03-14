@extends('test.ap')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-success text-white">Payment Successful!</div>

                <div class="card-body">
                    <h3 class="text-center text-success">Your round trip booking has been confirmed.</h3>
                    <p class="text-center">Thank you for your payment. Your tickets have been successfully booked.</p>

                    @if(isset($booking1) && $booking1)
                        <div class="alert alert-info mt-3">
                            <h5>First Leg Booking Details:</h5>
                            <p><strong>Booking Code:</strong> {{ $booking1->booking_code }}</p>
                            <p><strong>From:</strong> {{ $booking1->pickup_point }}</p>
                            <p><strong>To:</strong> {{ $booking1->dropping_point }}</p>
                            <p><strong>Travel Date:</strong> {{ $booking1->travel_date }}</p>
                            <p><strong>Seats:</strong> {{ $booking1->seat }}</p>
                            <p><strong>Amount Paid:</strong> {{ $currency }} {{ convert_money($booking1->amount) }}</p>
                        </div>
                    @endif

                    @if(isset($booking2) && $booking2)
                        @php
                            // For round trip, if second booking has same route as first, it should be reversed
                            $secondFrom = $booking2->pickup_point;
                            $secondTo = $booking2->dropping_point;
                            if (isset($booking1) && $booking1) {
                                // If routes are the same, swap them for the return trip
                                if ($booking1->pickup_point == $secondFrom && $booking1->dropping_point == $secondTo) {
                                    $secondFrom = $booking1->dropping_point;
                                    $secondTo = $booking1->pickup_point;
                                }
                            }
                        @endphp
                        <div class="alert alert-info mt-3">
                            <h5>Second Leg Booking Details:</h5>
                            <p><strong>Booking Code:</strong> {{ $booking2->booking_code }}</p>
                            <p><strong>From:</strong> {{ $secondFrom }}</p>
                            <p><strong>To:</strong> {{ $secondTo }}</p>
                            <p><strong>Travel Date:</strong> {{ $booking2->travel_date }}</p>
                            <p><strong>Seats:</strong> {{ $booking2->seat }}</p>
                            <p><strong>Amount Paid:</strong> {{ $currency }} {{ convert_money($booking2->amount) }}</p>
                        </div>
                    @endif

                    <div class="text-center mt-4">
                        <div class="mb-3">
                            <a href="{{ route('home') }}" class="btn btn-primary">Go to Home</a>
                            @if(auth()->check() && auth()->user()->isCustomer())
                                <a href="{{ route('customer.mybooking') }}" class="btn btn-secondary">View My Bookings</a>
                            @elseif(auth()->check() && auth()->user()->isVender())
                                <a href="{{ route('vender.history') }}" class="btn btn-secondary">View My Bookings</a>
                            @endif
                        </div>
                        
                        @if(isset($booking1) && $booking1)
                            <form action="{{ route('ticket.print') }}" method="POST" class="d-inline">
                                @csrf
                                <input type="hidden" name="data" value='{{ json_encode(["id" => $booking1->id]) }}'>
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-download"></i> Download Ticket (First Leg)
                                </button>
                            </form>
                        @endif
                        
                        @if(isset($booking2) && $booking2)
                            <form action="{{ route('ticket.print') }}" method="POST" class="d-inline">
                                @csrf
                                <input type="hidden" name="data" value='{{ json_encode(["id" => $booking2->id]) }}'>
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-download"></i> Download Ticket (Second Leg)
                                </button>
                            </form>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    (function() {
        var homeUrl = "{{ url('/') }}";
        if (window.history && window.history.pushState) {
            window.history.pushState({ ticketSuccess: true }, '', window.location.href);
            window.addEventListener('popstate', function() {
                window.location.href = homeUrl;
            });
        }
    })();
</script>
@endsection
