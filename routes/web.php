<?php

/*
 * CST-256 CLC
 * Alec, Nate and Patrick
 * This is a statement of our own work
 * 
|----------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


/*there is no longer a "Welcome to laravel/home" page we are going straight to the 
 * login page in the auth folder
 */

Route::get('/', function () {
    return view('auth.login');
});


    Route::get('/admin',function(){
        return view('admin');
    });
    
        Route::get('/user', function(){
            return view('/user');
        });


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/showUsers', function(){
    return view('showUsers');
});

    Route::get('/showAllJobListings', function(){
        return view('showAllJobListings');
    });
    
    
        Route::get('/educationPage', function(){
            return view('educationPage');
        });
    
// Route::get('/admin', function(){
//     echo "Hello Admin";
// })->middleware('admin');

// Route::get('/user', function(){
//     echo "Hello User";
// })->middleware('user');


// Route::get('/admin', function(){
//     return view('admin');
// });

// Route::get('/doLogin', 'HomeController@index');

//Route::get('/findUser', )