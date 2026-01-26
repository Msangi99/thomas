# Special Hire API - Complete Overview

## Introduction

The Special Hire API has been restructured into **three separate API sections** to serve different user roles:

1. **Admin API** - For coaster business owners/admins
2. **Driver API** - For coaster drivers
3. **Customer API** - For customers booking coasters

---

## Architecture Overview

### User Roles

| Role | Description | Registration | Access |
|------|-------------|--------------|--------|
| `special_hire` | Coaster business owner/admin | Manual/Admin | Full management access |
| `driver` | Coaster driver | Created by admin | Driver app features |
| `customer` | Customer booking coasters | Self-registration | Customer app features |

### Database Schema Updates

#### Coasters Table
- Added `driver_user_id` - Links driver user account to coaster
- Maintains `driver_name` and `driver_contact` for backward compatibility

#### Special Hire Orders Table
- Added `customer_user_id` - Links customer user account to order
- Maintains `customer_name`, `customer_phone`, `customer_email` for backward compatibility

---

## API Endpoints Summary

### 1. Admin API (`/api/special-hire/admin`)

**Authentication:** Bearer Token, Role: `special_hire`

#### Dashboard & Analytics
- `GET /dashboard` - Dashboard statistics
- `GET /dashboard/earnings` - Earnings summary

#### Coasters Management
- `GET /coasters` - List all coasters
- `GET /coasters/{id}` - Get single coaster
- `POST /coasters` - Create coaster
- `PUT /coasters/{id}` - Update coaster
- `DELETE /coasters/{id}` - Delete coaster

#### Location Tracking
- `GET /coasters/locations/all` - All coaster locations
- `GET /coasters/{id}/location` - Single coaster location
- `PUT /coasters/{id}/location` - Update location

#### Orders Management
- `GET /orders` - List all orders
- `GET /orders/{id}` - Get single order
- `POST /orders` - Create order
- `PUT /orders/{id}` - Update order
- `DELETE /orders/{id}` - Delete order

#### Pricing Management
- `GET /pricing/{coasterId}` - Get pricing
- `PUT /pricing/{coasterId}` - Update pricing
- `POST /calculate-price` - Calculate price

#### Driver Management
- `POST /drivers` - Create driver account
- `GET /drivers` - List all drivers
- `PUT /drivers/{driverId}` - Update driver
- `POST /coasters/{coasterId}/assign-driver` - Assign driver
- `POST /coasters/{coasterId}/unassign-driver` - Unassign driver

**Documentation:** [SPECIAL_HIRE_ADMIN_API.md](./SPECIAL_HIRE_ADMIN_API.md)

---

### 2. Driver API (`/api/special-hire/driver`)

**Authentication:** Bearer Token, Role: `driver`

#### Authentication
- `POST /login` - Driver login (no auth required)

#### Profile Management
- `GET /profile` - Get driver profile
- `PUT /profile` - Update profile

#### Coaster Information
- `GET /coaster` - Get assigned coaster

#### Orders Management
- `GET /orders` - List orders for driver's coaster
- `GET /orders/{id}` - Get single order
- `PUT /orders/{id}/status` - Update order status (start/complete trip)

#### History & Schedule
- `GET /history` - Completed/cancelled orders
- `GET /schedule` - Upcoming scheduled orders

#### Location Tracking
- `POST /location` - Update coaster GPS location

#### Logout
- `POST /logout` - Logout driver

**Documentation:** [SPECIAL_HIRE_DRIVER_API.md](./SPECIAL_HIRE_DRIVER_API.md)

---

### 3. Customer API (`/api/special-hire/customer`)

**Authentication:** Bearer Token, Role: `customer`

#### Authentication
- `POST /register` - Customer registration (no auth required)
- `POST /login` - Customer login (no auth required)

#### Profile Management
- `GET /profile` - Get customer profile
- `PUT /profile` - Update profile

#### Browse Coasters
- `GET /coasters` - Get all coasters with availability (map view)
- `GET /coasters/{id}` - Get single coaster

#### Price Calculation
- `POST /calculate-price` - Calculate trip price

#### Bookings Management
- `POST /bookings` - Create booking request
- `GET /bookings` - List customer's bookings
- `GET /bookings/{id}` - Get single booking
- `POST /bookings/{id}/cancel` - Cancel booking

#### Tracking
- `GET /bookings/{id}/track` - Track coaster location

#### Logout
- `POST /logout` - Logout customer

**Documentation:** [SPECIAL_HIRE_CUSTOMER_API.md](./SPECIAL_HIRE_CUSTOMER_API.md)

---

## Key Features

### For Admins
✅ Create and manage coasters  
✅ Create driver accounts and assign to coasters  
✅ Manage orders and bookings  
✅ Set pricing and calculate costs  
✅ Track all coasters in real-time  
✅ View dashboard analytics and earnings  

### For Drivers
✅ Login with credentials provided by admin  
✅ View assigned coaster information  
✅ See all orders for their coaster  
✅ View upcoming schedule  
✅ Start and complete trips  
✅ Update GPS location for tracking  
✅ View order history  

### For Customers
✅ Self-registration and login  
✅ View map with all available coasters  
✅ See real-time availability (🟢 Green = Available, 🔴 Red = Busy)  
✅ Calculate trip prices  
✅ Request bookings  
✅ View booking history  
✅ Track coaster location during trip  
✅ Cancel bookings  

---

## Availability Status System

### Map View Color Coding

Customers can see coasters on a map with color-coded availability:

- **🟢 Green (Available)**: Coaster is free and can be booked
- **🔴 Red (Busy)**: Coaster has an order or is currently on hire

### How It Works

1. **Real-time Check**: When customers view the map, they can optionally provide a date and time
2. **Availability Logic**:
   - If date/time provided: System checks if coaster has confirmed/in-progress orders at that time
   - If no date/time: System checks current coaster status
3. **Status Updates**:
   - When driver starts trip → Coaster status: `on_hire` (Red)
   - When driver completes trip → Coaster status: `available` (Green)

---

## Order Status Flow

### Complete Workflow

```
Customer Creates Booking
    ↓
[pending] - Waiting for admin confirmation
    ↓
Admin Confirms Order
    ↓
[confirmed] - Booking confirmed, waiting for trip date
    ↓
Driver Starts Trip (on hire date)
    ↓
[in_progress] - Trip in progress, coaster status: on_hire
    ↓
Driver Completes Trip
    ↓
[completed] - Trip completed, coaster status: available
```

### Status Options

| Status | Description | Who Can Set |
|--------|-------------|-------------|
| `pending` | New booking request | System (on creation) |
| `confirmed` | Booking confirmed by admin | Admin |
| `in_progress` | Trip started | Driver |
| `completed` | Trip finished | Driver |
| `cancelled` | Booking cancelled | Admin or Customer |

---

## Payment Status

| Status | Description |
|--------|-------------|
| `pending` | Payment not yet received |
| `paid` | Payment completed |
| `refunded` | Payment refunded |

**Note:** Only admins can update payment status.

---

## Pricing System

### Formula

```
Total = Base Price + (Billable KM × Price per KM) + Surcharges

Where:
- Billable KM = max(Actual KM, Min KM)
- Surcharges = (Base Price + KM Amount) × Surcharge Percentage
```

### Surcharge Rules

| Condition | Surcharge |
|-----------|-----------|
| Weekend (Sat, Sun) | +weekend_surcharge_percent |
| Night (18:00 - 06:00) | +night_surcharge_percent |
| Both conditions | Surcharges are cumulative |

### Example

**Coaster Pricing:**
- Base Price: 150,000 TZS
- Price per KM: 2,500 TZS
- Min KM: 20
- Weekend Surcharge: 15%
- Night Surcharge: 20%

**Trip Details:**
- Distance: 50 KM
- Date: Saturday (weekend)
- Time: 20:00 (night)

**Calculation:**
1. Base: 150,000 TZS
2. KM Amount: 50 × 2,500 = 125,000 TZS
3. Subtotal: 275,000 TZS
4. Surcharges: 15% + 20% = 35%
5. Surcharge Amount: 275,000 × 0.35 = 96,250 TZS
6. **Total: 371,250 TZS**

---

## Implementation Files

### Controllers
- `app/Http/Controllers/Api/SpecialHireApiController.php` - Admin API
- `app/Http/Controllers/Api/DriverApiController.php` - Driver API
- `app/Http/Controllers/Api/CustomerApiController.php` - Customer API

### Models
- `app/Models/Coaster.php` - Coaster model (updated)
- `app/Models/SpecialHireOrder.php` - Order model (updated)
- `app/Models/SpecialHirePricing.php` - Pricing model
- `app/Models/User.php` - User model

### Routes
- `routes/api.php` - All API routes

### Migrations
- `database/migrations/2025_12_19_000001_create_coasters_table.php`
- `database/migrations/2025_12_19_000002_create_special_hire_orders_table.php`
- `database/migrations/2025_12_18_000003_create_special_hire_pricing_table.php`

### Documentation
- `docs/api/SPECIAL_HIRE_ADMIN_API.md` - Admin API documentation
- `docs/api/SPECIAL_HIRE_DRIVER_API.md` - Driver API documentation
- `docs/api/SPECIAL_HIRE_CUSTOMER_API.md` - Customer API documentation
- `docs/api/SPECIAL_HIRE_API_OVERVIEW.md` - This file

---

## Setup Instructions

### 1. Run Migrations

```bash
php artisan migrate
```

This will create/update the following tables:
- `coasters` (with driver_user_id)
- `special_hire_orders` (with customer_user_id)
- `special_hire_pricing`

### 2. Create Admin Account

If you don't have an admin account yet, create one with role `special_hire`:

```sql
INSERT INTO users (name, email, password, role, created_at, updated_at)
VALUES ('Admin Name', 'admin@example.com', '$2y$10$...', 'special_hire', NOW(), NOW());
```

### 3. Test API Endpoints

Use Postman or any API client to test the endpoints. Start with:

1. **Admin Login**: `POST /api/auth/login`
2. **Create Coaster**: `POST /api/special-hire/admin/coasters`
3. **Create Driver**: `POST /api/special-hire/admin/drivers`
4. **Customer Registration**: `POST /api/special-hire/customer/register`
5. **Browse Coasters**: `GET /api/special-hire/customer/coasters`

---

## Security Notes

1. **Role-Based Access**: All endpoints are protected by role middleware
2. **Token Authentication**: Uses Laravel Sanctum for API authentication
3. **Validation**: All inputs are validated before processing
4. **Authorization**: Users can only access their own resources

---

## API Response Format

### Success Response
```json
{
    "success": true,
    "message": "Operation successful",
    "data": { ... }
}
```

### Error Response
```json
{
    "success": false,
    "message": "Error description"
}
```

### Validation Error
```json
{
    "success": false,
    "errors": {
        "field_name": ["Error message"]
    }
}
```

---

## Rate Limiting

- **Default**: 60 requests per minute per user
- **Headers**: 
  - `X-RateLimit-Limit`: Maximum requests allowed
  - `X-RateLimit-Remaining`: Requests remaining
  - `Retry-After`: Seconds until rate limit resets

---

## Support

For API support and questions:
- Email: api-support@example.com
- Documentation: See individual API documentation files

---

**Version:** 1.0.0  
**Last Updated:** December 19, 2024  
**Author:** Development Team



