# Ripoti: Shida Za Upande Wa Vendor (Vendor Side Issues)

**Tarehe:** 28 Feb 2026  
**Lengo:** Kutoa ripoti na mapendekezo ya urekebishaji kwa mambo manne yaliyotajwa kwenye upande wa vendor.

---

## 1. Vendor Commission (Ukomizi wa Vendor)

### Uchunguzi
- **Mahali:** `resources/views/vender/history.blade.php` (safu ya "Commission")
- Ukomizi unakokotwa kwa backend kama **vender_fee** (share ya system fee) na **vender_service** (share ya service/payment fees) kulingana na `VenderAccount->percentage`.
- Kwenye ukurasa wa **Booking History**, safu ya Commission inaonyesha:
  - **System (Service cashFee):** `$booking->fee`
  - **Vendor:** `$booking->vender_fee` tu
  - **Discount**, **VAT**
- **Shida:** **vender_service** haionyeshwi wazi kwenye safu ya Commission. Jumla inayotumika kwenye jedwali inatumia `fee + vender_fee + amount + vat + fee_vat` bila `service` na `vender_service`, huku kwenye mstari uliofichwa (hidden) jumla kamili inatumia `service` na `vender_service` — kuna kutofautiana na ukomizi wa vendor haujathibitishwa kwa ufasaha (service share haionekani).

### Mapendekezo
- Onyesha **vender_service** pia kwenye safu ya Commission (mfano: mstari wa "Vendor service: X" chini ya "Vendor: Y").
- Hakikisha **Grand Total** na jumla za kila mstari zinajumlisha `service` na `vender_service` kwa usawa na backend (na print/service receipt) ili vendor aone jumla yake kamili na commission zote (fee + service share).

**Faili zinazohusika:**  
`resources/views/vender/history.blade.php`, `lang/en/vender/history.php`, `lang/sw/vender/history.php`

---

## 2. Landing Page After Payment (Ukurasa Wa Kutua Baada Ya Malipo)

### Uchunguzi
- **Mahali:** Ukurasa wa uthibitishaji baada ya malipo ya round trip kwa vendor unatumia view **`resources/views/vender/round_payment_success.blade.php`**.
- Route / flow: malipo yanakamilika → `RoundTripController::paymentSuccess()` → `direction('round_payment_success', compact('booking1', 'booking2', 'isRound'))` → view `vender.round_payment_success`.
- Ukurasa una kichwa kijani "Payment Successful!", ujumbe wa uthibitishaji, First Leg na Second Leg booking details (booking code, from, to, travel date, seats, amount paid), na vitufe "Return Home" na "View My Bookings".

### Shida Zilizokithiri
- **Hakuna jina la basi (bus name)** kwenye ukurasa huu — inahusiana na shida #4 (Round trip → bus name button).
- **Session:** `booking1` na `booking2` zinatokana na session; baada ya deserialize relations (kama `bus`, `campany`) zinaweza kutokuja. Ni vyema kuzireload na `bus` na `campany` ili ukurasa uweze kuonyesha jina la basi na kampuni bila hitaji la kubadilisha flow nyingi.

### Mapendekezo
- Kubali kuwa "landing page after payment" ipo na inafanya kazi; lengo ni **kuiboresha** kwa kuongeza taarifa zinazokosekana (jina la basi/kampuni — tazama #4) na kuhakikisha data inapakuliwa kwa uhakika (reload bookings na relations kwenye controller).

**Faili zinazohusika:**  
`app/Http/Controllers/RoundTripController.php` (reload bookings), `resources/views/vender/round_payment_success.blade.php`

---

## 3. Booking History Page Size (Ukubwa Wa Ukurasa Wa Historia Ya Bookings)

### Uchunguzi
- **Mahali:** `app/Http/Controllers/VenderController.php`, method `history()`.
- Hivi sasa: `$bookings = $query->where('payment_status', 'Paid')->latest()->get();`
- **Shida:** Hakuna **pagination**. Bookings zote za vendor zinapakuliwa na kuonyeshwa kwa wakati mmoja. Kwa vendor wenye bookings nyingi, ukurasa unakuwa mzito na muda mrefu (performance na UX).

### Mapendekezo
- Badilisha kutoka `->get()` kwenda **`->paginate(20)`** (au nambari nyingine inayofaa, mfano 15, 25).
- Hakikisha view `vender/history.blade.php` inaonyesha links za pagination (Laravel `$bookings->links()`).
- DataTables inatumika kwenye ukurasa; pagination ya server-side inaweza kuhitaji kuunganisha na DataTables (au kushughulikia pagination ya Laravel kwa ajili ya "page size" ya ukurasa).

**Faili zinazohusika:**  
`app/Http/Controllers/VenderController.php`, `resources/views/vender/history.blade.php`

---

## 4. Round Trip → Bus Name Button (Jina La Basi Kwenye Round Trip)

### Uchunguzi
- **Mahali:** Ukurasa wa uthibitishaji wa round trip (landing baada ya malipo) — `resources/views/vender/round_payment_success.blade.php`.
- First Leg na Second Leg zinaonyesha: Booking Code, From, To, Travel Date, Seats, Amount Paid. **Hakuna jina la basi wala kampuni (company name)**.
- Mtumiaji anahitaji kuona **jina la basi** (na kwa mantiki kampuni) kwa kila leg — na kama kuna mahali pa "button", inaweza kuwa kitufe kinachoonyesha/ku-link kwa taarifa za basi.

### Mapendekezo
- **Kwenye controller** (`RoundTripController::paymentSuccess()`): baada ya kuchukua `booking1` na `booking2` kutoka session, **reload** kutoka DB na relations ili data iwe fresh na relations ziwe loaded:
  - `Booking::with(['bus', 'campany'])->find($booking1->id)` na vivyo hivyo kwa `booking2`.
- **Kwenye view** `vender/round_payment_success.blade.php`:
  - Chini ya "First Leg Booking Details" ongeza mstari (au kitufe): **Bus:** `{{ $booking1->bus->bus_number ?? 'N/A' }}`, **Company:** `{{ $booking1->campany->name ?? 'N/A' }}`.
  - Chini ya "Second Leg Booking Details" ongeza: **Bus:** `{{ $booking2->bus->bus_number ?? 'N/A' }}`, **Company:** `{{ $booking2->campany->name ?? 'N/A' }}`.
- Kama "button" inamaanisha kitufe kinachofungua ukurasa/taarifa za basi, ongeza link (kwa mfano kwa route ya bus/schedule) kwenye jina la basi au kampuni.

**Faili zinazohusika:**  
`app/Http/Controllers/RoundTripController.php`, `resources/views/vender/round_payment_success.blade.php`, `lang/en/vender/busroot.php`, `lang/sw/vender/busroot.php` (kwa labels kama "Bus", "Company")

---

## Muhtasari Wa Vitendo

| # | Shida | Kitendo Kipendekezo |
|---|--------|----------------------|
| 1 | Vendor commission | Onyesha vender_service kwenye Commission; sawazisha Grand Total na jumla za mstari |
| 2 | Landing page after payment | Thibitisha flow; ongeza bus/company na reload data kwenye controller |
| 3 | Booking history page size | Ingiza pagination (paginate) kwenye VenderController::history() na links kwenye view |
| 4 | Round trip → bus name button | Reload booking1/booking2 na bus,campany; onyesha bus name na company kwenye round_payment_success |

---

*Ripoti imeandaliwa kwa ajili ya urekebishaji wa halfu za upande wa vendor.*
