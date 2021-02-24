<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\Models\User;
use App\Services\Business\BusinessService;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */

    
    
    public function index(Request $request)
    {
        //I forgot what nate had but I think he had "credits"
        
        $credits = new User($request->get('email'), $request->get('password'));
        
        //instantiate the business logic
        $serviceLogin = new BusinessService();
        
        
        //pass credits to to the business layer
        $isValid = $serviceLogin->Verify($credits);
        
        //Determine which view to diplay
        if($isValid)
        {
            $data = ['model' => $credits];
        //login passed?? I DONT KNOW THIS I NEED HELP
        return view('login')->with($data);
        }
        else if($isValid)
              {
                $data = ['model' => $credits];
                 return view('admin')->with($data);
              }
        else
        {
            return view("Login Failed");
        }
        
    }
        
             
    }
    

