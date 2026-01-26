# Special Hire Pricing Changes - Base Price Removed

## Summary
The special hire pricing calculation has been updated to **remove the base price** component. The system now calculates prices based purely on **distance × price per kilometer** plus any applicable surcharges.

**Important:** The customer app calculates the total amount and sends it to the server. The booking endpoint accepts `total_amount` and `distance_km` from the customer app.

## Changes Made

### 1. Core Pricing Model (`app/Models/SpecialHirePricing.php`)
- Modified `calculatePrice()` method to exclude base_price from calculations
- New formula: `Total = (distance × price_per_km) + surcharges`
- Old formula: `Total = base_price + (distance × price_per_km) + surcharges`
- Surcharges are now applied only to the km_amount (not base_price + km_amount)
- `base_price` is kept in response for backward compatibility but set to 0

### 2. API Documentation (`docs/api/SPECIAL_HIRE_CUSTOMER_API.md`)
- Updated Quick Guide to reflect no base price
- Updated all example responses showing base_price as 0
- Updated pricing calculation formula documentation
- Adjusted total amounts in all examples to reflect distance-only pricing
- **Updated booking endpoint to require `distance_km` and `total_amount` from customer app**
- Added workflow notes explaining customer app calculates and sends the amount

### 3. View Files Updated

#### Order Management Views
- **`resources/views/special_hire/orders/show.blade.php`**
  - Removed "Base Price" row from price breakdown
  - Now shows only: Distance Charge, Surcharge (if any), and Total

- **`resources/views/special_hire/orders/create.blade.php`**
  - Removed "Base Price" display from price estimate
  - Updated JavaScript `calculatePrice()` function to exclude base price
  - Updated `resetPriceDisplay()` function accordingly

#### Coaster Management Views
- **`resources/views/special_hire/coasters/create.blade.php`**
  - Updated default base_price from 100,000 to 0
  - Added hint text: "Leave as 0 for distance-only pricing"

- **`resources/views/special_hire/coasters/edit.blade.php`**
  - Updated default base_price from 100,000 to 0
  - Added hint text: "Leave as 0 for distance-only pricing"

- **`resources/views/special_hire/coasters/index.blade.php`**
  - Removed "Base Price" display
  - Now shows "Price Per KM" and "Min Distance" instead

- **`resources/views/special_hire/pricing.blade.php`**
  - Updated example calculation to exclude base price
  - Changed text to "Example: 50 km trip (no base price)"

### 4. Database Migration (`database/migrations/2025_12_18_000003_create_special_hire_pricing_table.php`)
- Changed default value of `base_price` from 100,000 to 0
- Added comment explaining the new pricing model

### 5. Customer API Controller (`app/Http/Controllers/Api/CustomerApiController.php`)
- **Updated `createBooking()` method to accept `distance_km` and `total_amount` from request**
- Added validation for `distance_km` (required) and `total_amount` (required)
- Server now uses the amount calculated by customer app instead of recalculating
- Still calculates breakdown for record-keeping purposes

## Workflow

### Customer App → Server Flow

1. **Customer selects pickup and dropoff locations**
   - App calculates distance using GPS coordinates

2. **Customer app calls price calculator** (optional but recommended)
   ```
   POST /api/special-hire/customer/calculate-price
   ```
   - Gets price breakdown and surcharges

3. **Customer app calculates total amount**
   ```
   total_amount = distance_km × price_per_km
   
   if weekend:
       total_amount += (total_amount × 0.15)
   if night (6PM-6AM):
       total_amount += (total_amount × 0.20)
   ```

4. **Customer app sends booking request**
   ```
   POST /api/special-hire/customer/bookings
   
   Body:
   {
     "coaster_id": 123,
     "distance_km": 25.5,
     "total_amount": 63750,
     "pickup_location": "...",
     "dropoff_location": "...",
     ... other fields
   }
   ```

5. **Server accepts the amount from customer app**
   - Server stores the `total_amount` provided by customer app
   - Server also calculates breakdown for admin records
   - Booking is created with status `pending`

---

## Pricing Formula

### New Formula (Current)
```
Total = (Billable KM × Price per KM) + Surcharges

Where:
- Billable KM = max(Actual KM, Min KM)
- Surcharges = KM Amount × Surcharge Percentage
- NO BASE PRICE is included
```

### Example Calculations

#### Example 1: Simple 25km trip
- Distance: 25 km
- Price per km: 2,500 TZS
- Calculation: 25 × 2,500 = 62,500 TZS
- **Total: 62,500 TZS**

#### Example 2: 50km weekend night trip
- Distance: 50 km
- Price per km: 2,500 TZS
- Base amount: 50 × 2,500 = 125,000 TZS
- Weekend surcharge: +15%
- Night surcharge: +20%
- Combined surcharge: 35%
- Surcharge amount: 125,000 × 0.35 = 43,750 TZS
- **Total: 168,750 TZS**

## Backward Compatibility

The `base_price` field is still:
- Present in the database schema
- Returned in API responses (as 0)
- Stored with orders (as 0)
- Visible in admin forms (defaulted to 0)

This ensures existing integrations continue to work without breaking changes.

## Impact on Customer Experience

### Before
Customers paid: Base Price + Distance Charge + Surcharges

Example: 150,000 + (25 × 2,500) + 0 = **212,500 TZS**

### After
Customers pay: Distance Charge + Surcharges

Example: (25 × 2,500) + 0 = **62,500 TZS**

**Result: More transparent, distance-based pricing that customers can easily calculate themselves.**

## Controllers Affected (No code changes needed)

All controllers continue to use the `SpecialHirePricing::calculatePrice()` method, which automatically applies the new logic:

- `app/Http/Controllers/Api/CustomerApiController.php`
- `app/Http/Controllers/Api/SpecialHireApiController.php`
- `app/Http/Controllers/SpecialHireController.php`

## Testing Recommendations

1. Test price calculation API endpoint with various distances
2. Verify surcharge calculations (weekend/night) still work correctly
3. Test booking creation with the new pricing
4. Verify order display shows correct breakdowns
5. Test price estimation in customer app

## Migration Notes

If you have existing pricing records with non-zero base prices, you may want to run:

```sql
UPDATE special_hire_pricing SET base_price = 0;
```

Or create a new migration to update existing records.

---

**Date:** December 20, 2025
**Changes By:** System Update
**Status:** ✅ Completed

