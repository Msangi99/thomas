# Special Hire Admin API Documentation

**Base URL:** `/api/special-hire/admin`

**Authentication:** Bearer Token (Laravel Sanctum)

**Required Role:** `special_hire`

---

## Table of Contents

1. [Authentication](#authentication)
2. [Dashboard & Analytics](#dashboard--analytics)
3. [Coasters Management](#coasters-management)
4. [Location Tracking](#location-tracking)
5. [Orders Management](#orders-management)
6. [Pricing Management](#pricing-management)
7. [Price Calculation](#price-calculation)
8. [Driver Management](#driver-management)
9. [Error Responses](#error-responses)

---

## Authentication

All admin API endpoints require authentication using Laravel Sanctum Bearer tokens.

### Headers Required

```
Authorization: Bearer {your_access_token}
Accept: application/json
Content-Type: application/json
```

### Getting Access Token

```http
POST /api/auth/login
```

**Request Body:**
```json
{
    "email": "admin@example.com",
    "password": "your_password"
}
```

**Response:**
```json
{
    "success": true,
    "message": "Login successful",
    "data": {
        "user": {
            "id": 1,
            "name": "Admin Name",
            "email": "admin@example.com",
            "role": "special_hire"
        },
        "token": "1|abc123xyz..."
    }
}
```

---

## Dashboard & Analytics

### Get Dashboard Statistics

Retrieve overview statistics for your special hire business.

```http
GET /api/special-hire/admin/dashboard
```

**Response:**
```json
{
    "success": true,
    "data": {
        "total_coasters": 10,
        "available_coasters": 7,
        "on_hire_coasters": 3,
        "total_orders": 150,
        "pending_orders": 5,
        "completed_orders": 140,
        "today_orders": 3,
        "total_revenue": 15000000,
        "today_revenue": 450000,
        "month_revenue": 5500000
    }
}
```

---

### Get Earnings Summary

Retrieve earnings for a specific period.

```http
GET /api/special-hire/admin/dashboard/earnings
```

**Query Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `period` | string | No | `month` | Period for earnings. Options: `today`, `week`, `month`, `year` |

**Example Request:**
```http
GET /api/special-hire/admin/dashboard/earnings?period=week
```

**Response:**
```json
{
    "success": true,
    "data": {
        "period": "week",
        "start_date": "2024-12-16",
        "end_date": "2024-12-22",
        "total_earnings": 2500000,
        "total_orders": 12,
        "total_distance_km": 450.5
    }
}
```

---

## Coasters Management

### List All Coasters

Retrieve all coasters owned by the authenticated admin.

```http
GET /api/special-hire/admin/coasters
```

**Query Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `status` | string | No | Filter by status: `available`, `on_hire`, `maintenance` |

**Example Request:**
```http
GET /api/special-hire/admin/coasters?status=available
```

**Response:**
```json
{
    "success": true,
    "data": [
        {
            "id": 1,
            "user_id": 5,
            "name": "Luxury Coaster A",
            "plate_number": "T 123 ABC",
            "capacity": 30,
            "model": "Toyota Coaster 2022",
            "color": "White",
            "driver_name": "John Doe",
            "driver_contact": "+255712345678",
            "features": "AC, WiFi, Reclining Seats",
            "status": "available",
            "image": "coasters/coaster1.jpg",
            "latitude": -6.7924,
            "longitude": 39.2083,
            "last_location_update": "2024-12-19T10:30:00.000000Z",
            "created_at": "2024-01-15T08:00:00.000000Z",
            "updated_at": "2024-12-19T10:30:00.000000Z",
            "pricing": {
                "id": 1,
                "coaster_id": 1,
                "base_price": 150000,
                "price_per_km": 2500,
                "min_km": 20,
                "weekend_surcharge_percent": 15,
                "night_surcharge_percent": 20
            }
        }
    ]
}
```

---

### Get Single Coaster

Retrieve details of a specific coaster.

```http
GET /api/special-hire/admin/coasters/{id}
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | integer | Yes | Coaster ID |

**Response:**
```json
{
    "success": true,
    "data": {
        "id": 1,
        "user_id": 5,
        "name": "Luxury Coaster A",
        "plate_number": "T 123 ABC",
        "capacity": 30,
        "model": "Toyota Coaster 2022",
        "color": "White",
        "driver_name": "John Doe",
        "driver_contact": "+255712345678",
        "features": "AC, WiFi, Reclining Seats",
        "status": "available",
        "image": "coasters/coaster1.jpg",
        "latitude": -6.7924,
        "longitude": 39.2083,
        "last_location_update": "2024-12-19T10:30:00.000000Z",
        "pricing": {
            "id": 1,
            "coaster_id": 1,
            "base_price": 150000,
            "price_per_km": 2500,
            "min_km": 20,
            "weekend_surcharge_percent": 15,
            "night_surcharge_percent": 20
        }
    }
}
```

---

### Create Coaster

Add a new coaster to your fleet.

```http
POST /api/special-hire/admin/coasters
```

**Request Body:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | string | Yes | Coaster name (max 100 chars) |
| `plate_number` | string | Yes | Vehicle plate number (max 20 chars, unique) |
| `capacity` | integer | Yes | Passenger capacity (1-100) |
| `model` | string | No | Vehicle model (max 100 chars) |
| `color` | string | No | Vehicle color (max 50 chars) |
| `driver_name` | string | No | Driver's name (max 100 chars) |
| `driver_contact` | string | No | Driver's phone number (max 20 chars) |
| `features` | string | No | Comma-separated features |
| `base_price` | numeric | Yes | Base hiring price (TZS) |
| `price_per_km` | numeric | Yes | Price per kilometer (TZS) |
| `min_km` | integer | Yes | Minimum billable kilometers |
| `weekend_surcharge_percent` | numeric | No | Weekend surcharge % (default: 15) |
| `night_surcharge_percent` | numeric | No | Night surcharge % (default: 20) |

**Example Request:**
```json
{
    "name": "Premium Bus Alpha",
    "plate_number": "T 456 XYZ",
    "capacity": 45,
    "model": "Mercedes Sprinter 2023",
    "color": "Silver",
    "driver_name": "James Smith",
    "driver_contact": "+255787654321",
    "features": "AC, WiFi, USB Charging, Entertainment System",
    "base_price": 200000,
    "price_per_km": 3000,
    "min_km": 25,
    "weekend_surcharge_percent": 20,
    "night_surcharge_percent": 25
}
```

**Response (201 Created):**
```json
{
    "success": true,
    "message": "Coaster created successfully",
    "data": {
        "id": 2,
        "user_id": 5,
        "name": "Premium Bus Alpha",
        "plate_number": "T 456 XYZ",
        "capacity": 45,
        "model": "Mercedes Sprinter 2023",
        "color": "Silver",
        "driver_name": "James Smith",
        "driver_contact": "+255787654321",
        "features": "AC, WiFi, USB Charging, Entertainment System",
        "status": "available",
        "pricing": {
            "coaster_id": 2,
            "base_price": 200000,
            "price_per_km": 3000,
            "min_km": 25,
            "weekend_surcharge_percent": 20,
            "night_surcharge_percent": 25
        }
    }
}
```

---

### Update Coaster

Update an existing coaster's details.

```http
PUT /api/special-hire/admin/coasters/{id}
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | integer | Yes | Coaster ID |

**Request Body (all fields optional):**

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Coaster name (max 100 chars) |
| `plate_number` | string | Vehicle plate number (max 20 chars) |
| `capacity` | integer | Passenger capacity (1-100) |
| `model` | string | Vehicle model (max 100 chars) |
| `color` | string | Vehicle color (max 50 chars) |
| `status` | string | Status: `available`, `on_hire`, `maintenance` |
| `driver_name` | string | Driver's name (max 100 chars) |
| `driver_contact` | string | Driver's phone number (max 20 chars) |
| `features` | string | Comma-separated features |
| `base_price` | numeric | Base hiring price (TZS) |
| `price_per_km` | numeric | Price per kilometer (TZS) |
| `min_km` | integer | Minimum billable kilometers |
| `weekend_surcharge_percent` | numeric | Weekend surcharge % |
| `night_surcharge_percent` | numeric | Night surcharge % |

**Example Request:**
```json
{
    "status": "maintenance",
    "driver_name": "New Driver Name",
    "driver_contact": "+255799999999"
}
```

**Response:**
```json
{
    "success": true,
    "message": "Coaster updated successfully",
    "data": {
        "id": 1,
        "name": "Luxury Coaster A",
        "status": "maintenance",
        "driver_name": "New Driver Name",
        "driver_contact": "+255799999999",
        "...": "..."
    }
}
```

---

### Delete Coaster

Remove a coaster from your fleet.

```http
DELETE /api/special-hire/admin/coasters/{id}
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | integer | Yes | Coaster ID |

**Response:**
```json
{
    "success": true,
    "message": "Coaster deleted successfully"
}
```

---

## Location Tracking

### Get All Coasters Locations

Retrieve current locations of all coasters with GPS data.

```http
GET /api/special-hire/admin/coasters/locations/all
```

**Response:**
```json
{
    "success": true,
    "data": [
        {
            "id": 1,
            "name": "Luxury Coaster A",
            "plate_number": "T 123 ABC",
            "latitude": -6.7924,
            "longitude": 39.2083,
            "status": "on_hire",
            "driver_name": "John Doe",
            "driver_contact": "+255712345678",
            "last_location_update": "2024-12-19T10:30:00.000000Z"
        },
        {
            "id": 2,
            "name": "Premium Bus Alpha",
            "plate_number": "T 456 XYZ",
            "latitude": -6.8125,
            "longitude": 39.2890,
            "status": "available",
            "driver_name": "James Smith",
            "driver_contact": "+255787654321",
            "last_location_update": "2024-12-19T10:25:00.000000Z"
        }
    ]
}
```

---

### Get Single Coaster Location

Retrieve the current location of a specific coaster.

```http
GET /api/special-hire/admin/coasters/{id}/location
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | integer | Yes | Coaster ID |

**Response:**
```json
{
    "success": true,
    "data": {
        "id": 1,
        "name": "Luxury Coaster A",
        "plate_number": "T 123 ABC",
        "latitude": -6.7924,
        "longitude": 39.2083,
        "status": "on_hire",
        "driver_name": "John Doe",
        "driver_contact": "+255712345678",
        "last_location_update": "2024-12-19T10:30:00.000000Z"
    }
}
```

---

### Update Coaster Location

Update the GPS location of a coaster (typically called by driver app).

```http
PUT /api/special-hire/admin/coasters/{id}/location
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | integer | Yes | Coaster ID |

**Request Body:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `latitude` | numeric | Yes | Latitude coordinate (-90 to 90) |
| `longitude` | numeric | Yes | Longitude coordinate (-180 to 180) |

**Example Request:**
```json
{
    "latitude": -6.7935,
    "longitude": 39.2095
}
```

**Response:**
```json
{
    "success": true,
    "message": "Location updated successfully",
    "data": {
        "coaster_id": 1,
        "latitude": -6.7935,
        "longitude": 39.2095,
        "last_updated": "2024-12-19T10:35:00.000000Z"
    }
}
```

---

## Orders Management

### List All Orders

Retrieve all orders with optional filters.

```http
GET /api/special-hire/admin/orders
```

**Query Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `status` | string | No | Filter by order status: `pending`, `confirmed`, `in_progress`, `completed`, `cancelled` |
| `payment_status` | string | No | Filter by payment: `pending`, `paid`, `refunded` |
| `date` | date | No | Filter by hire date (YYYY-MM-DD) |
| `coaster_id` | integer | No | Filter by coaster ID |
| `per_page` | integer | No | Items per page (default: 15) |

**Example Request:**
```http
GET /api/special-hire/admin/orders?status=pending&per_page=10
```

**Response:**
```json
{
    "success": true,
    "data": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "user_id": 5,
                "coaster_id": 1,
                "customer_name": "Jane Customer",
                "customer_phone": "+255755123456",
                "customer_email": "jane@email.com",
                "pickup_location": "Dar es Salaam, Kariakoo",
                "pickup_latitude": -6.8235,
                "pickup_longitude": 39.2695,
                "dropoff_location": "Bagamoyo Beach",
                "dropoff_latitude": -6.4466,
                "dropoff_longitude": 38.9027,
                "hire_date": "2024-12-25",
                "hire_time": "08:00:00",
                "return_date": "2024-12-25",
                "return_time": "18:00:00",
                "passengers_count": 25,
                "purpose": "Company Team Building",
                "notes": "Please arrive 15 minutes early",
                "distance_km": 65.5,
                "base_price": 150000,
                "price_per_km": 2500,
                "km_amount": 163750,
                "surcharge_percent": 0,
                "surcharge_amount": 0,
                "total_amount": 313750,
                "order_status": "pending",
                "payment_status": "pending",
                "payment_method": null,
                "created_at": "2024-12-18T14:30:00.000000Z",
                "coaster": {
                    "id": 1,
                    "name": "Luxury Coaster A",
                    "plate_number": "T 123 ABC"
                }
            }
        ],
        "first_page_url": "...",
        "from": 1,
        "last_page": 5,
        "last_page_url": "...",
        "per_page": 10,
        "to": 10,
        "total": 45
    }
}
```

---

### Get Single Order

Retrieve details of a specific order.

```http
GET /api/special-hire/admin/orders/{id}
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | integer | Yes | Order ID |

**Response:**
```json
{
    "success": true,
    "data": {
        "id": 1,
        "user_id": 5,
        "coaster_id": 1,
        "customer_name": "Jane Customer",
        "customer_phone": "+255755123456",
        "customer_email": "jane@email.com",
        "pickup_location": "Dar es Salaam, Kariakoo",
        "pickup_latitude": -6.8235,
        "pickup_longitude": 39.2695,
        "dropoff_location": "Bagamoyo Beach",
        "dropoff_latitude": -6.4466,
        "dropoff_longitude": 38.9027,
        "hire_date": "2024-12-25",
        "hire_time": "08:00:00",
        "return_date": "2024-12-25",
        "return_time": "18:00:00",
        "passengers_count": 25,
        "purpose": "Company Team Building",
        "notes": "Please arrive 15 minutes early",
        "distance_km": 65.5,
        "base_price": 150000,
        "price_per_km": 2500,
        "km_amount": 163750,
        "surcharge_percent": 0,
        "surcharge_amount": 0,
        "total_amount": 313750,
        "order_status": "pending",
        "payment_status": "pending",
        "payment_method": null,
        "created_at": "2024-12-18T14:30:00.000000Z",
        "updated_at": "2024-12-18T14:30:00.000000Z",
        "coaster": {
            "id": 1,
            "name": "Luxury Coaster A",
            "plate_number": "T 123 ABC",
            "capacity": 30
        }
    }
}
```

---

### Create Order

Create a new hire order manually.

```http
POST /api/special-hire/admin/orders
```

**Request Body:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `coaster_id` | integer | Yes | ID of the coaster to hire |
| `customer_name` | string | Yes | Customer's full name (max 100 chars) |
| `customer_phone` | string | Yes | Customer's phone number (max 20 chars) |
| `customer_email` | string | No | Customer's email (max 100 chars) |
| `pickup_location` | string | Yes | Pickup address (max 255 chars) |
| `pickup_latitude` | numeric | No | Pickup latitude coordinate |
| `pickup_longitude` | numeric | No | Pickup longitude coordinate |
| `dropoff_location` | string | Yes | Drop-off address (max 255 chars) |
| `dropoff_latitude` | numeric | No | Drop-off latitude coordinate |
| `dropoff_longitude` | numeric | No | Drop-off longitude coordinate |
| `hire_date` | date | Yes | Date of hire (YYYY-MM-DD, must be today or future) |
| `hire_time` | time | Yes | Pickup time (HH:MM) |
| `return_date` | date | No | Return date (YYYY-MM-DD) |
| `return_time` | time | No | Return time (HH:MM) |
| `passengers_count` | integer | Yes | Number of passengers (min: 1) |
| `purpose` | string | No | Purpose of hire (max 255 chars) |
| `notes` | string | No | Additional notes |
| `distance_km` | numeric | No | Manual distance if coordinates not provided |

**Example Request:**
```json
{
    "coaster_id": 1,
    "customer_name": "ABC Company Ltd",
    "customer_phone": "+255755999888",
    "customer_email": "bookings@abc.co.tz",
    "pickup_location": "Dar es Salaam, Mlimani City",
    "pickup_latitude": -6.7724,
    "pickup_longitude": 39.2283,
    "dropoff_location": "Zanzibar Ferry Terminal",
    "dropoff_latitude": -6.8167,
    "dropoff_longitude": 39.2833,
    "hire_date": "2024-12-28",
    "hire_time": "06:00",
    "return_date": "2024-12-28",
    "return_time": "10:00",
    "passengers_count": 20,
    "purpose": "Airport Transfer",
    "notes": "VIP guests, please provide bottled water"
}
```

**Response (201 Created):**
```json
{
    "success": true,
    "message": "Order created successfully",
    "data": {
        "id": 25,
        "coaster_id": 1,
        "customer_name": "ABC Company Ltd",
        "customer_phone": "+255755999888",
        "customer_email": "bookings@abc.co.tz",
        "pickup_location": "Dar es Salaam, Mlimani City",
        "dropoff_location": "Zanzibar Ferry Terminal",
        "hire_date": "2024-12-28",
        "hire_time": "06:00:00",
        "passengers_count": 20,
        "distance_km": 25,
        "base_price": 150000,
        "price_per_km": 2500,
        "km_amount": 62500,
        "surcharge_percent": 0,
        "surcharge_amount": 0,
        "total_amount": 212500,
        "order_status": "pending",
        "payment_status": "pending",
        "coaster": {
            "id": 1,
            "name": "Luxury Coaster A",
            "plate_number": "T 123 ABC"
        }
    }
}
```

---

### Update Order

Update an existing order's status.

```http
PUT /api/special-hire/admin/orders/{id}
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | integer | Yes | Order ID |

**Request Body:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `order_status` | string | No | Order status: `pending`, `confirmed`, `in_progress`, `completed`, `cancelled` |
| `payment_status` | string | No | Payment status: `pending`, `paid`, `refunded` |
| `payment_method` | string | No | Payment method used (max 50 chars) |

**Example Request:**
```json
{
    "order_status": "confirmed",
    "payment_status": "paid",
    "payment_method": "M-Pesa"
}
```

**Response:**
```json
{
    "success": true,
    "message": "Order updated successfully",
    "data": {
        "id": 25,
        "order_status": "confirmed",
        "payment_status": "paid",
        "payment_method": "M-Pesa",
        "...": "..."
    }
}
```

**Note:** When order status changes to `in_progress`, the associated coaster status automatically changes to `on_hire`. When order status changes to `completed` or `cancelled`, the coaster status changes back to `available`.

---

### Delete Order

Delete a pending order.

```http
DELETE /api/special-hire/admin/orders/{id}
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | integer | Yes | Order ID |

**Response:**
```json
{
    "success": true,
    "message": "Order deleted successfully"
}
```

**Note:** Only orders with `pending` status can be deleted.

---

## Pricing Management

### Get Coaster Pricing

Retrieve pricing configuration for a specific coaster.

```http
GET /api/special-hire/admin/pricing/{coasterId}
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `coasterId` | integer | Yes | Coaster ID |

**Response:**
```json
{
    "success": true,
    "data": {
        "id": 1,
        "coaster_id": 1,
        "base_price": 150000,
        "price_per_km": 2500,
        "min_km": 20,
        "weekend_surcharge_percent": 15,
        "night_surcharge_percent": 20,
        "created_at": "2024-01-15T08:00:00.000000Z",
        "updated_at": "2024-12-10T14:30:00.000000Z"
    }
}
```

---

### Update Coaster Pricing

Update pricing configuration for a coaster.

```http
PUT /api/special-hire/admin/pricing/{coasterId}
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `coasterId` | integer | Yes | Coaster ID |

**Request Body:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `base_price` | numeric | Yes | Base hiring price in TZS (min: 0) |
| `price_per_km` | numeric | Yes | Price per kilometer in TZS (min: 0) |
| `min_km` | integer | Yes | Minimum billable kilometers (min: 1) |
| `weekend_surcharge_percent` | numeric | Yes | Weekend surcharge percentage (0-100) |
| `night_surcharge_percent` | numeric | Yes | Night surcharge percentage (0-100) |

**Example Request:**
```json
{
    "base_price": 180000,
    "price_per_km": 3000,
    "min_km": 25,
    "weekend_surcharge_percent": 20,
    "night_surcharge_percent": 25
}
```

**Response:**
```json
{
    "success": true,
    "message": "Pricing updated successfully",
    "data": {
        "id": 1,
        "coaster_id": 1,
        "base_price": 180000,
        "price_per_km": 3000,
        "min_km": 25,
        "weekend_surcharge_percent": 20,
        "night_surcharge_percent": 25,
        "updated_at": "2024-12-19T11:00:00.000000Z"
    }
}
```

---

## Price Calculation

### Calculate Trip Price

Calculate the price for a trip before creating an order.

```http
POST /api/special-hire/admin/calculate-price
```

**Request Body:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `coaster_id` | integer | Yes | ID of the coaster |
| `pickup_latitude` | numeric | Conditional* | Pickup latitude |
| `pickup_longitude` | numeric | Conditional* | Pickup longitude |
| `dropoff_latitude` | numeric | Conditional* | Drop-off latitude |
| `dropoff_longitude` | numeric | Conditional* | Drop-off longitude |
| `distance_km` | numeric | Conditional* | Manual distance in km |
| `hire_date` | date | Yes | Date of hire (YYYY-MM-DD) |
| `hire_time` | time | Yes | Time of hire (HH:MM) |

*Either provide coordinates (all 4: pickup_latitude, pickup_longitude, dropoff_latitude, dropoff_longitude) OR distance_km

**Example Request (with coordinates):**
```json
{
    "coaster_id": 1,
    "pickup_latitude": -6.7724,
    "pickup_longitude": 39.2283,
    "dropoff_latitude": -6.8167,
    "dropoff_longitude": 39.2833,
    "hire_date": "2024-12-28",
    "hire_time": "14:00"
}
```

**Example Request (with manual distance):**
```json
{
    "coaster_id": 1,
    "distance_km": 50,
    "hire_date": "2024-12-28",
    "hire_time": "14:00"
}
```

**Response:**
```json
{
    "success": true,
    "data": {
        "coaster": {
            "id": 1,
            "name": "Luxury Coaster A",
            "capacity": 30
        },
        "distance_km": 50,
        "billable_km": 50,
        "breakdown": {
            "base_price": 150000,
            "price_per_km": 2500,
            "km_amount": 125000,
            "surcharge_percent": 0,
            "surcharge_labels": [],
            "surcharge_amount": 0
        },
        "total_amount": 275000,
        "currency": "TZS"
    }
}
```

**Response with Surcharges (Weekend/Night):**
```json
{
    "success": true,
    "data": {
        "coaster": {
            "id": 1,
            "name": "Luxury Coaster A",
            "capacity": 30
        },
        "distance_km": 50,
        "billable_km": 50,
        "breakdown": {
            "base_price": 150000,
            "price_per_km": 2500,
            "km_amount": 125000,
            "surcharge_percent": 35,
            "surcharge_labels": ["Weekend (+15%)", "Night (+20%)"],
            "surcharge_amount": 96250
        },
        "total_amount": 371250,
        "currency": "TZS"
    }
}
```

---

## Driver Management

### Create Driver Account

Create a new driver account and assign to a coaster.

```http
POST /api/special-hire/admin/drivers
```

**Request Body:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `coaster_id` | integer | Yes | ID of the coaster to assign driver to |
| `name` | string | Yes | Driver's full name |
| `email` | string | Yes | Driver's email (must be unique) |
| `phone` | string | Yes | Driver's phone number |
| `password` | string | Yes | Driver's password (min 6 chars) |

**Example Request:**
```json
{
    "coaster_id": 1,
    "name": "John Driver",
    "email": "john.driver@example.com",
    "phone": "+255712345678",
    "password": "driver123"
}
```

**Response (201 Created):**
```json
{
    "success": true,
    "message": "Driver account created and assigned successfully",
    "data": {
        "driver": {
            "id": 10,
            "name": "John Driver",
            "email": "john.driver@example.com",
            "phone": "+255712345678",
            "role": "driver"
        },
        "coaster": {
            "id": 1,
            "name": "Luxury Coaster A",
            "plate_number": "T 123 ABC"
        }
    }
}
```

**Error Response (400):**
```json
{
    "success": false,
    "message": "This coaster already has a driver assigned"
}
```

---

### Get All Drivers

Retrieve all drivers assigned to admin's coasters.

```http
GET /api/special-hire/admin/drivers
```

**Response:**
```json
{
    "success": true,
    "data": [
        {
            "driver": {
                "id": 10,
                "name": "John Driver",
                "email": "john.driver@example.com",
                "phone": "+255712345678",
                "role": "driver"
            },
            "coaster": {
                "id": 1,
                "name": "Luxury Coaster A",
                "plate_number": "T 123 ABC"
            }
        },
        {
            "driver": {
                "id": 11,
                "name": "Jane Driver",
                "email": "jane.driver@example.com",
                "phone": "+255787654321",
                "role": "driver"
            },
            "coaster": {
                "id": 2,
                "name": "Premium Bus Alpha",
                "plate_number": "T 456 XYZ"
            }
        }
    ]
}
```

---

### Update Driver

Update driver account information.

```http
PUT /api/special-hire/admin/drivers/{driverId}
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `driverId` | integer | Yes | Driver user ID |

**Request Body:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | string | No | Driver's name |
| `phone` | string | No | Driver's phone number |
| `password` | string | No | New password (min 6 chars) |

**Example Request:**
```json
{
    "name": "John Updated Driver",
    "phone": "+255712999888",
    "password": "newpassword123"
}
```

**Response:**
```json
{
    "success": true,
    "message": "Driver updated successfully",
    "data": {
        "id": 10,
        "name": "John Updated Driver",
        "email": "john.driver@example.com",
        "phone": "+255712999888"
    }
}
```

---

### Assign Driver to Coaster

Assign an existing driver to a coaster.

```http
POST /api/special-hire/admin/coasters/{coasterId}/assign-driver
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `coasterId` | integer | Yes | Coaster ID |

**Request Body:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `driver_id` | integer | Yes | Driver user ID |

**Example Request:**
```json
{
    "driver_id": 10
}
```

**Response:**
```json
{
    "success": true,
    "message": "Driver assigned successfully",
    "data": {
        "coaster": {
            "id": 1,
            "name": "Luxury Coaster A",
            "plate_number": "T 123 ABC"
        },
        "driver": {
            "id": 10,
            "name": "John Driver",
            "email": "john.driver@example.com",
            "phone": "+255712345678"
        }
    }
}
```

**Error Response (400):**
```json
{
    "success": false,
    "message": "This driver is already assigned to another coaster"
}
```

---

### Unassign Driver from Coaster

Remove driver assignment from a coaster.

```http
POST /api/special-hire/admin/coasters/{coasterId}/unassign-driver
```

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `coasterId` | integer | Yes | Coaster ID |

**Response:**
```json
{
    "success": true,
    "message": "Driver unassigned successfully"
}
```

**Error Response (400):**
```json
{
    "success": false,
    "message": "No driver assigned to this coaster"
}
```

---

## Error Responses

### Standard Error Format

All error responses follow this format:

```json
{
    "success": false,
    "message": "Error description"
}
```

### Validation Errors (422)

```json
{
    "success": false,
    "errors": {
        "field_name": [
            "The field_name is required.",
            "The field_name must be a valid email address."
        ],
        "another_field": [
            "The another_field must be at least 10 characters."
        ]
    }
}
```

### Common HTTP Status Codes

| Code | Description |
|------|-------------|
| `200` | Success |
| `201` | Created successfully |
| `400` | Bad Request (business logic error) |
| `401` | Unauthorized (missing or invalid token) |
| `403` | Forbidden (insufficient permissions/wrong role) |
| `404` | Resource not found |
| `422` | Validation error |
| `500` | Server error |

### Example Error Responses

**401 Unauthorized:**
```json
{
    "message": "Unauthenticated."
}
```

**403 Forbidden:**
```json
{
    "success": false,
    "message": "You do not have permission to access this resource."
}
```

**404 Not Found:**
```json
{
    "success": false,
    "message": "Coaster not found"
}
```

**400 Bad Request:**
```json
{
    "success": false,
    "message": "Only pending orders can be deleted"
}
```

---

## Pricing Calculation Logic

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
| Weekend (Saturday, Sunday) | +weekend_surcharge_percent |
| Night (18:00 - 06:00) | +night_surcharge_percent |
| Both conditions | Surcharges are cumulative |

---

## Rate Limiting

API requests are rate limited to prevent abuse:

- **Default:** 60 requests per minute per user
- **Headers returned:**
  - `X-RateLimit-Limit`: Maximum requests allowed
  - `X-RateLimit-Remaining`: Requests remaining
  - `Retry-After`: Seconds until rate limit resets (when exceeded)

---

## Changelog

| Version | Date | Changes |
|---------|------|---------|
| 1.1.0 | 2024-12-19 | Added Driver Management endpoints |
| 1.0.0 | 2024-12-19 | Initial release |

---

**Need Help?**

For API support, contact: api-support@example.com

