<!DOCTYPE html>
<html>

<head>
    <title>Bus Ticket</title>
    <style>
        body {
            font-family: 'Courier New', Courier, monospace;
            font-size: 10px;
            line-height: 1.2;
            margin: 0;
            padding: 5mm;
            width: 80mm;
        }

        .ticket-container {
            width: 100%;
        }

        .header,
        .footer {
            text-align: center;
            margin-bottom: 2mm;
        }

        .details table {
            width: 100%;
            border-collapse: collapse;
        }

        .details table th,
        .details table td {
            padding: 1mm 0;
            text-align: left;
        }

        .divider {
            border-top: 1px dashed #000;
            margin: 2mm 0;
        }

        .qr-code-container {
            text-align: center;
            /* Center the QR code */
            margin-left: 20%;
            height: 3.2cm;
        }
    </style>
</head>

<body>
    <div class="ticket-container">
        <div class="header">
            <h2>BUS TICKET</h2>
            @php
                // Get bus owner account from the busowner's profile (prioritize busowner profile data)
                $busCompany = null;
                $busOwnerAccount = null;
                
                // First, try to get busowner user from company and use their profile BusOwnerAccount
                if (isset($data->bus) && $data->bus && isset($data->bus->campany) && $data->bus->campany) {
                    $busCompany = $data->bus->campany;
                    // Get busowner user from company
                    if ($busCompany->user) {
                        $busOwnerUser = $busCompany->user;
                        // Try to get BusOwnerAccount linked to busowner user_id
                        $busOwnerAccount = \App\Models\BusOwnerAccount::where('user_id', $busOwnerUser->id)->first();
                    }
                    // Fallback to company's busOwnerAccount if busowner profile not found
                    if (!$busOwnerAccount) {
                        $busOwnerAccount = $busCompany->busOwnerAccount ?? null;
                    }
                }
                
                // Fallback to booking's company if bus company not available
                if (!$busOwnerAccount && isset($data->campany) && $data->campany) {
                    $busCompany = $data->campany;
                    // Get busowner user from company
                    if ($busCompany->user) {
                        $busOwnerUser = $busCompany->user;
                        // Try to get BusOwnerAccount linked to busowner user_id
                        $busOwnerAccount = \App\Models\BusOwnerAccount::where('user_id', $busOwnerUser->id)->first();
                    }
                    // Fallback to company's busOwnerAccount if busowner profile not found
                    if (!$busOwnerAccount) {
                        $busOwnerAccount = $data->campany->busOwnerAccount ?? null;
                    }
                }
            @endphp
            <p style="font-weight: bold; font-size: 15px;">{{ $busCompany->name ?? ($data->campany->name ?? 'N/A') }}</p>
            <p>P. O. Box {{ $busOwnerAccount->box ?? 'N/A' }}</p>
            
            <p>Reg. No: {{ $busOwnerAccount->registration_number ?? 'N/A' }}</p>
            <p>TIN: {{ $busOwnerAccount->tin ?? 'N/A' }}</p>
            <p>VRN: {{ $busOwnerAccount->vrn ?? 'N/A' }}</p>
        </div>

        <div class="divider"></div>

        <div class="details">
            <table>
                <tr>
                    <td>Traveller Name:</td>
                    <td>{{ $data->customer_name ?? 'N/A' }}</td>
                </tr>
                <tr>
                    <td>Traveller Contact:</td>
                    <td>
                        @php
                            $contact = null;
                            // First try customer_phone
                            if (isset($data->customer_phone) && !empty($data->customer_phone) && $data->customer_phone != 'N/A') {
                                $contact = $data->customer_phone;
                            }
                            // If not available, try payment_number
                            if (!$contact && isset($data->payment_number) && !empty($data->payment_number) && $data->payment_number != 'N/A') {
                                $contact = $data->payment_number;
                            }
                            // If still not available, try user contact
                            if (!$contact && isset($data->user) && $data->user && isset($data->user->contact) && !empty($data->user->contact)) {
                                $contact = $data->user->contact;
                            }
                        @endphp
                        {{ $contact ?? 'N/A' }}
                    </td>
                </tr>
                <tr>
                    <td>Booking number:</td>
                    <td>{{ $data->booking_code ?? 'N/A' }}</td>
                </tr>
                <tr>
                    <td>Bus number:</td>
                    <td>{{ $data->bus->bus_number ?? 'N/A' }}</td>
                </tr>
                <tr>
                    <td>Route:</td>
                    <td>{{ $data->pickup_point ?? optional($data->schedule)->from ?? optional(optional($data->bus)->route)->from ?? 'N/A' }} - {{ $data->dropping_point ?? optional($data->schedule)->to ?? optional(optional($data->bus)->route)->to ?? 'N/A' }}</td>
                </tr>
                @php
                    $travelDateRaw = $data->travel_date ?? null;
                    $travelDateFormatted = $travelDateRaw ? \Carbon\Carbon::parse($travelDateRaw)->format('d M Y') : 'N/A';
                    $insuranceDateFormatted = isset($data->insuranceDate) && $data->insuranceDate ? \Carbon\Carbon::parse($data->insuranceDate)->format('d M Y') : 'N/A';
                    $travelDate = $travelDateRaw;
                    $departureTime = null;
                    $arrivalTime = null;
                    if (isset($data->schedule) && $data->schedule) {
                        $departureTime = $data->schedule->start ?? null;
                        $arrivalTime = $data->schedule->end ?? null;
                    }
                    if ((!$departureTime || !$arrivalTime) && isset($data->bus->route) && $data->bus->route) {
                        if (!$departureTime) $departureTime = $data->bus->route->route_start ?? null;
                        if (!$arrivalTime) $arrivalTime = $data->bus->route->route_end ?? null;
                    }
                    $reportingTimeStr = 'N/A';
                    $departureTimeStr = 'N/A';
                    $arrivalTimeStr = 'N/A';
                    $arrivalDateStr = $travelDateFormatted;
                    if ($travelDate && $departureTime) {
                        try {
                            $departureDt = \Carbon\Carbon::parse($travelDate . ' ' . $departureTime);
                            $reportingTimeStr = $departureDt->copy()->subMinutes(30)->format('h:i A');
                            $departureTimeStr = $departureDt->format('h:i A');
                        } catch (\Exception $e) {
                            $reportingTimeStr = is_string($departureTime) ? $departureTime : 'N/A';
                            $departureTimeStr = $reportingTimeStr;
                        }
                    }
                    if ($travelDate && $arrivalTime) {
                        try {
                            $arrivalDt = \Carbon\Carbon::parse($travelDate . ' ' . $arrivalTime);
                            $arrivalTimeStr = $arrivalDt->format('h:i A');
                            if ($departureTime && $arrivalDt->format('H:i') < \Carbon\Carbon::parse($departureTime)->format('H:i')) {
                                $arrivalDt->addDay();
                                $arrivalTimeStr = $arrivalDt->format('h:i A');
                                $arrivalDateStr = $arrivalDt->format('d M Y');
                            }
                        } catch (\Exception $e) {
                            $arrivalTimeStr = is_string($arrivalTime) ? $arrivalTime : 'N/A';
                        }
                    }
                @endphp
                <tr>
                    <td>Travel date:</td>
                    <td>{{ $travelDateFormatted }}</td>
                </tr>
                <tr>
                    <td>Reporting time:</td>
                    <td>{{ $travelDateFormatted }} {{ $reportingTimeStr }}</td>
                </tr>
                <tr>
                    <td>Departure time:</td>
                    <td>{{ $travelDateFormatted }} {{ $departureTimeStr }}</td>
                </tr>
                <tr>
                    <td>Arrival date and time:</td>
                    <td>{{ $arrivalDateStr }} {{ $arrivalTimeStr }}</td>
                </tr>
                <tr>
                    <td>Seat number:</td>
                    <td>{{ $data->seat ?? 'N/A' }}</td>
                </tr>
                <tr>
                    <td>Bus Fare:</td>
                    <td>{{ ceil($data->amount + $data->vender_fee + $data->fee + $data->vat) ?? 'N/A' }}</td>
                </tr>
            </table>
        </div>

        <div class="divider"></div>

        <div class="details">
            <h3>Insurance Details</h3>
            <table>
                <tr>
                    <td>Insurance company:</td>
                    <td>G.A Insurance</td>
                </tr>
                <tr>
                    <td>Policy:</td>
                    <td>Safiri salama - Domestic</td>
                </tr>
                <tr>
                    <td>Date and time of issue:</td>
                    <td>{{ $travelDateFormatted }}</td>
                </tr>
                <tr>
                    <td>Expire date and time:</td>
                    <td>{{ $insuranceDateFormatted }}</td>
                </tr>
                <tr>
                    <td>Amount paid for insurance:</td>
                    <td>{{ $data->bima_amount }}</td>
                </tr>
            </table>
        </div>

        <div class="divider"></div>

        <div class="details">
            <table>
                <tr>
                    <td>Conductor number:</td>
                    <td>{{ $data->bus->conductor ?? 'N/A' }}</td>
                </tr>
                @if ($data->vender_id)
                    <tr>
                        <td>Vendor Name:</td>
                        <td>{{ $data->vender->name }}</td>
                    </tr>
                    <tr>
                        <td>Vendor Number:</td>
                        <td>{{ $data->vender->contact }}</td>
                    </tr>
                @endif
            </table>
        </div>

        <div class="divider"></div>

        <div class="qr-code-container">
            {!! $data->qrcode !!}
        </div>

        <div class="divider"></div>

        <div class="footer">
            <div class="container">
                                <h6 class="text-muted">
                                    Nunua ticket mtandaoni kwa usalama wa hali ya juu wakati wowote na bila usumbufu kwa
                                    kutembelea www.hisgc.co.tz au piga <a href="tel:*149*46*36#">*149*46*36#</a> halafu
                                    fuata maelekezo ya kununua ticket au piga <a href="tel:+255755879793">+255 755 879
                                        793</a> kwa msaada zaidi. Highlink ISGC</h6>
                            </div>
        </div>
    </div>
</body>

</html>
