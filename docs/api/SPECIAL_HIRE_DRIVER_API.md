# Special Hire Driver API Documentation

**Base URL:** `/api/special-hire/driver`

**Authentication:** Bearer Token (Laravel Sanctum)

**Required Role:** `driver`

---

## Table of Contents

1. [Authentication](#authentication)
2. [Profile Management](#profile-management)
3. [Coaster Information](#coaster-information)
4. [Orders Management](#orders-management)
5. [History & Schedule](#history--schedule)
6. [Location Tracking](#location-tracking)
7. [Error Responses](#error-responses)

---

## Authentication

### Driver Login

**Note:** Driver accounts are created by coaster admins. Drivers cannot register themselves.

```http
POST /api/special-hire/driver/login
```

**Request Body:**
```json
{
    "email": "driver@example.com",
    "password": "your_password"
}
```

**Response (200 OK):**
```json
{
    "success": true,
    "message": "Login successful",
    "data": {
        "user": {
            "id": 10,
            "name": "John Driver",
            "email": "driver@example.com",
            "phone": "+255712345678",
            "role": "driver"
        },
        "token": "2|abc123xyz..."
    }
}
```

**Error Response (401 Unauthorized):**
```json
{
    "success": false,
    "message": "Invalid credentials"
}
```

**Error Response (403 Forbidden):**
```json
{
    "success": false,
    "message": "Unauthorized. Driver access only."
}
```

### Headers Required for Protected Routes

```
Authorization: Bearer {your_access_token}
Accept: application/json
Content-Type: application/json
```

---

## Profile Management

### Get Driver Profile

Retrieve driver profile information and assigned coaster.

```http
GET /api/special-hire/driver/profile
```

**Response:**
```json
{
    "success": true,
    "data": {
        "user": {
            "id": 10,
            "name": "John Driver",
            "email": "driver@example.com",
            "phone": "+255712345678",
            "role": "driver"
        },
        "coaster": {
            "id": 1,
            "user_id": 5,
            "driver_user_id": 10,
            "name": "Luxury Coaster A",
            "plate_number": "T 123 ABC",
            "capacity": 30,
            "model": "Toyota Coaster 2022",
            "color": "White",
            "status": "available",
            "image_url": "http://example.com/storage/coasters/coaster1.jpg",
            "features": "AC, WiFi, Reclining Seats",
            "latitude": -6.7924,
            "longitude": 39.2083,
            "last_location_update": "2024-12-19T10:30:00.000000Z",
            "pricing": {
                "id": 1,
                "coaster_id": 1,
                "base_price": 150000,
                "price_per_km": 2500,
                "min_km": 20
            }
        }
    }
}
```

---

### Update Driver Profile

Update driver's personal information.

```http
PUT /api/special-hire/driver/profile
```

**Request Body:**
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | string | No | Driver's name |
| `phone` | string | No | Phone number |
| `password` | string | No | New password (min 6 chars) |
| `password_confirmation` | string | Conditional | Required if password is provided |

**Example Request:**
```json
{
    "name": "John Updated Driver",
    "phone": "+255712345999",
    "password": "newpassword123",
    "password_confirmation": "newpassword123"
}
```

**Response:**
```json
{
    "success": true,
    "message": "Profile updated successfully",
    "data": {
        "id": 10,
        "name": "John Updated Driver",
        "email": "driver@example.com",
        "phone": "+255712345999"
    }
}
```

---

## Coaster Information

### Get Assigned Coaster

Retrieve details of the coaster assigned to the driver.

```http
GET /api/special-hire/driver/coaster
```

**Response:**
```json
{
    "success": true,
    "data": {
        "id": 1,
        "user_id": 5,
        "driver_user_id": 10,
        "name": "Luxury Coaster A",
        "plate_number": "T 123 ABC",
        "capacity": 30,
        "model": "Toyota Coaster 2022",
        "color": "White",
        "status": "available",
        "features": "AC, WiFi, Reclining Seats",
        "latitude": -6.7924,
        "longitude": 39.2083,
        "last_location_update": "2024-12-19T10:30:00.000000Z",
        "pricing": {
            "base_price": 150000,
            "price_per_km": 2500,
            "min_km": 20
        }
    }
}
```

**Error Response (404):**
```json
{
    "success": false,
    "message": "No coaster assigned to you"
}
```

---

## Orders Management

### Get All Orders

Retrieve all orders for the driver's coaster.

```http
GET /api/special-hire/driver/orders
```

**Query Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `status` | string | No | Filter by status: `pending`, `confirmed`, `in_progress`, `completed`, `cancelled` |
| `date` | date | No | Filter by hire date (YYYY-MM-DD) |
| `per_page` | integer | No | Items per page (default: 15) |

**Example Request:**
```http
GET /api/special-hire/driver/orders?status=confirmed&per_page=10
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
                "order_code": "SH-20241219-001",
                "user_id": 5,
                "customer_user_id": 15,
                "coaster_id": 1,
                "customer_name": "Jane Customer",
                "customer_phone": "+255755123456",
                "customer_email": "jane@email.com",
                "pickup_location": "Dar es Salaam, Kariakoo",
                "dropoff_location": "Bagamoyo Beach",
                "hire_date": "2024-12-25",
                "hire_time": "08:00:00",
                "return_date": "2024-12-25",
                "return_time": "18:00:00",
                "passengers_count": 25,
                "purpose": "Company Team Building",
                "notes": "Please arrive 15 minutes early",
                "distance_km": 65.5,
                "total_amount": 313750,
                "order_status": "confirmed",
                "payment_status": "paid",
                "coaster": {
                    "id": 1,
                    "name": "Luxury Coaster A",
                    "plate_number": "T 123 ABC"
                },
                "customer": {
                    "id": 15,
                    "name": "Jane Customer",
                    "email": "jane@email.com",
                    "phone": "+255755123456"
                }
            }
        ],
        "per_page": 10,
        "total": 25
    }
}
```

---

### Get Single Order

Retrieve details of a specific order.

```http
GET /api/special-hire/driver/orders/{id}
```

**Response:**
```json
{
    "success": true,
    "data": {
        "id": 1,
        "order_code": "SH-20241219-001",
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
        "total_amount": 313750,
        "order_status": "confirmed",
        "payment_status": "paid",
        "coaster": {
            "id": 1,
            "name": "Luxury Coaster A",
            "plate_number": "T 123 ABC"
        }
    }
}
```

---

### Update Order Status

Update order status when starting or completing a trip.

```http
PUT /api/special-hire/driver/orders/{id}/status
```

**Request Body:**
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `order_status` | string | Yes | Status: `in_progress` or `completed` |

**Example Request:**
```json
{
    "order_status": "in_progress"
}
```

**Response:**
```json
{
    "success": true,
    "message": "Order status updated successfully",
    "data": {
        "id": 1,
        "order_code": "SH-20241219-001",
        "order_status": "in_progress",
        "...": "..."
    }
}
```

**Note:** 
- When status changes to `in_progress`, the coaster status automatically changes to `on_hire`
- When status changes to `completed`, the coaster status changes back to `available`

---

## History & Schedule

### Get Order History

Retrieve completed and cancelled orders.

```http
GET /api/special-hire/driver/history
```

**Query Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `per_page` | integer | No | Items per page (default: 15) |

**Response:**
```json
{
    "success": true,
    "data": {
        "current_page": 1,
        "data": [
            {
                "id": 5,
                "order_code": "SH-20241215-003",
                "customer_name": "ABC Company",
                "hire_date": "2024-12-15",
                "hire_time": "09:00:00",
                "total_amount": 250000,
                "order_status": "completed",
                "payment_status": "paid"
            }
        ],
        "per_page": 15,
        "total": 45
    }
}
```

---

### Get Order Schedule

Retrieve upcoming confirmed and pending orders.

```http
GET /api/special-hire/driver/schedule
```

**Query Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `per_page` | integer | No | Items per page (default: 15) |

**Response:**
```json
{
    "success": true,
    "data": {
        "current_page": 1,
        "data": [
            {
                "id": 8,
                "order_code": "SH-20241225-001",
                "customer_name": "Jane Customer",
                "pickup_location": "Dar es Salaam, Kariakoo",
                "dropoff_location": "Bagamoyo Beach",
                "hire_date": "2024-12-25",
                "hire_time": "08:00:00",
                "passengers_count": 25,
                "order_status": "confirmed",
                "payment_status": "paid"
            }
        ],
        "per_page": 15,
        "total": 5
    }
}
```

---

## Location Tracking

### Update Coaster Location

Update the GPS location of the coaster (for real-time tracking).

```http
POST /api/special-hire/driver/location
```

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

## Logout

### Driver Logout

Logout and invalidate the current access token.

```http
POST /api/special-hire/driver/logout
```

**Response:**
```json
{
    "success": true,
    "message": "Logged out successfully"
}
```

---

## Error Responses

### Standard Error Format

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
            "The field_name is required."
        ]
    }
}
```

### Common HTTP Status Codes

| Code | Description |
|------|-------------|
| `200` | Success |
| `401` | Unauthorized (missing or invalid token) |
| `403` | Forbidden (not a driver or wrong role) |
| `404` | Resource not found |
| `422` | Validation error |
| `500` | Server error |

---

## Usage Notes

1. **Driver Account Creation**: Drivers cannot register themselves. Accounts are created by coaster admins through the admin panel.

2. **Single Coaster Assignment**: Each driver is assigned to one coaster at a time.

3. **Order Status Flow**:
   - `pending` → `confirmed` (by admin)
   - `confirmed` → `in_progress` (by driver when starting trip)
   - `in_progress` → `completed` (by driver when finishing trip)

4. **Location Updates**: Drivers should update their location periodically (e.g., every 30 seconds) when on an active trip for real-time tracking.

5. **Payment**: Drivers cannot modify payment status. This is handled by admins.

---

**Version:** 1.0.0  
**Last Updated:** December 19, 2024

For support, contact: api-support@example.com



