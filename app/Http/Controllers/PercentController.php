<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PercentController extends Controller
{
    const PERCENTAGE = 0.05;              // 5% system commission (bus owner commission percentage)
    const GOVERNMENT_LEVY_PERCENTAGE = 0.05; // 5% government levy on bus fare
    const VENDOR_PERCENTAGE = 10;         // 10% default vendor share (as whole number, e.g. 10 = 10%)
    const BUS_OWNER_ADDING_FIGURE = 500;  // Fixed bus owner adding figure
    const MINIMUM_AMOUNT = 1000;          // Minimum amount for percentage calculation
}
