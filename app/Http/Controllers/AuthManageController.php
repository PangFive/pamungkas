<?php

namespace App\Http\Controllers;

use App\Models\User;
use Auth;
use Session;
use Illuminate\Http\Request;

class AuthManageController extends Controller
{
    // Show View Login
    public function viewLogin()
    {
        if (auth()->check()) {
            return redirect('/dashboard');
        }else{
            $users = User::all()
            ->count();

            return view('landing', compact('users'));
        }
    	
    }

    // Verify Login
    public function verifyLogin(Request $request)
    {
    	if(Auth::attempt($request->only('email', 'password'))){
    		return redirect('/dashboard');
    	}
    	Session::flash('login_failed', 'Email atau password salah');
    	
    	return redirect('/login');
    }

    // Logout Process
    public function logoutProcess()
    {
    	Auth::logout();

    	return redirect('/');
    }
}