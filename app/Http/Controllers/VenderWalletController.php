<?php

namespace App\Http\Controllers;

use App\Http\Controllers\PDOController;
use App\Http\Controllers\TigosecureController;
use App\Models\Transaction;
use App\Models\VenderBalance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;

class VenderWalletController extends Controller
{
    public function showDepositForm()
    {
        return view('vender.deposit');
    }

    public function deposit(Request $request)
    {
        $request->validate([
            'amount' => 'required|numeric|min:1',
            'payment_method' => 'required|in:tigosecure,pdo,clickpesa',
            'deposit_phone' => 'nullable|string|max:30',
        ]);

        $user = auth()->user();
        if ($request->payment_method == 'pdo') {
            $phone = $user->contact;
            $email = $user->email;
            $name = $user->name;
            $amount = $request->amount;

            Session::put('amount', $amount);

            $pdo = new PDOController();

            return $pdo->VenderinitiatePayment($amount, $name, 'vender', $phone, $email);
        }

        if ($request->payment_method === 'clickpesa') {
            $amount = (float) $request->amount;
            $minTzs = (float) env('CLICKPESA_MIN_AMOUNT_TZS', 908);
            if ($amount < $minTzs) {
                return back()->withInput()->with('error', "ClickPesa requires at least {$minTzs} TZS per payment.");
            }

            $phone = $request->input('deposit_phone') ?: $user->contact ?: $user->phone;
            if (!$phone) {
                return back()->withInput()->with('error', 'Enter a mobile number for ClickPesa (or set phone on your profile).');
            }

            $msisdn = ClickPesaController::normalizeTanzaniaMsisdnForClickPesa((string) $phone);
            if (!$msisdn['ok']) {
                return back()->withInput()->with('error', $msisdn['error'] ?? 'Invalid phone number for ClickPesa.');
            }
            $phone = $msisdn['phone'];

            Session::forget(['booking', 'booking1', 'booking2', 'booking_form', 'is_round']);
            Session::put('amount', $amount);
            Session::put('vender', 'vender');

            $parts = preg_split('/\s+/', trim((string) $user->name), 2);
            $first = $parts[0] ?: 'Vendor';
            $last = $parts[1] ?? '';

            $orderId = 'VWDEP' . $user->id . 'T' . time();
            $clickpesa = new ClickPesaController();

            return $clickpesa->initiatePayment(
                (int) round($amount),
                $first,
                $last,
                $phone,
                $user->email ?? '',
                $orderId
            );
        }

        return back()->with('error', 'Select a payment method');
    }

    public function returned()
    {
        $amount = Session::get('amount');
        $user = auth()->user();
        if ($amount && $user->VenderBalances) {
            if (Schema::hasColumn('vender_balances', 'sell_cash_amount')) {
                $user->VenderBalances()->increment('sell_cash_amount', $amount);
            } else {
                $user->VenderBalances()->increment('amount', $amount);
            }
        }
        Session::forget(['amount', 'vender']);

        return redirect()->route('vender.transaction')->with('success', 'Payment processed successfully');
    }

    /**
     * PDO success redirect target (route exists; credits cash wallet).
     */
    public function depositSuccess()
    {
        return $this->returned();
    }

    /**
     * PDO cancel / failure.
     */
    public function depositFail()
    {
        Session::forget('amount');

        return redirect()->route('vender.wallet.deposit')->with('error', 'Deposit was not completed');
    }

    /**
     * Move funds between commission wallet (`amount`) and cash wallet (`sell_cash_amount`).
     */
    public function transferInternal(Request $request)
    {
        $request->validate([
            'direction' => 'required|in:to_sell_cash,to_commission',
            'amount' => 'required|numeric|min:0.01',
        ]);

        $user = auth()->user();
        $vb = $user->VenderBalances;
        if (!$vb || !Schema::hasColumn('vender_balances', 'sell_cash_amount')) {
            return back()->with('error', 'Wallet split is not available');
        }

        $amt = round((float) $request->amount, 2);
        try {
            DB::transaction(function () use ($vb, $request, $amt) {
                $locked = VenderBalance::query()->whereKey($vb->id)->lockForUpdate()->firstOrFail();
                if ($request->direction === 'to_sell_cash') {
                    if ((float) $locked->amount < $amt) {
                        throw new \RuntimeException('Insufficient commission wallet balance');
                    }
                    $locked->decrement('amount', $amt);
                    $locked->increment('sell_cash_amount', $amt);
                } else {
                    if ((float) $locked->sell_cash_amount < $amt) {
                        throw new \RuntimeException('Insufficient cash wallet balance');
                    }
                    $locked->decrement('sell_cash_amount', $amt);
                    $locked->increment('amount', $amt);
                }
            });
        } catch (\Throwable $e) {
            return back()->with('error', $e->getMessage());
        }

        return back()->with('success', 'Transfer completed');
    }

    /**
     * One-time style migration: move the entire commission wallet balance to the cash wallet
     * when the cash wallet is still zero (typical right after the wallet split migration).
     */
    public function migrateLegacyBalanceToCash()
    {
        $user = auth()->user();
        $vb = $user->VenderBalances;
        if (!$vb || !Schema::hasColumn('vender_balances', 'sell_cash_amount')) {
            return back()->with('error', 'Wallet split is not available');
        }

        try {
            DB::transaction(function () use ($vb) {
                $locked = VenderBalance::query()->whereKey($vb->id)->lockForUpdate()->firstOrFail();
                if ((float) ($locked->sell_cash_amount ?? 0) > 0) {
                    throw new \RuntimeException('Cash wallet is already in use. Use Transfer to move a specific amount.');
                }
                $amt = round((float) $locked->amount, 2);
                if ($amt <= 0) {
                    throw new \RuntimeException('No balance in the commission wallet to move.');
                }
                $locked->decrement('amount', $amt);
                $locked->increment('sell_cash_amount', $amt);
            });
        } catch (\Throwable $e) {
            return back()->with('error', $e->getMessage());
        }

        return back()->with('success', 'Your previous balance was moved to the cash wallet. New commissions will appear in the commission wallet.');
    }
}
