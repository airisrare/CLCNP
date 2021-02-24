<?php
/* This should show the users profile, here we can edit the profile or delete the user */
// //testing=========================================================================================
// $loginInfo = array();
// //fetch data from the database
// $data = mysql_query('SELECT name, username, password from users') or die("Query fail: " . mysqli_error());
?>
<!-- bootstrap profile, NK edited the original styling IMAGES FROM Unsplash, free commerical immages -->
@extends('layouts.app') @section('content')

<h5 class="mt-0 mb-0" align='center'>Hello Admin</h5>
<div class="row py-5 px-4">
	<div class="col-md-5 mx-auto">
		<!-- Profile widget -->
		<div class="bg-white shadow rounded overflow-hidden">
			<div class="px-4 pt-0 pb-4 cover">
				<div class="media align-items-end profile-head">
					<div class="profile mr-3">
						<img
							src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
							alt="..." width="130" class="rounded mb-2 img-thumbnail">
						<!-- EDIT THE PROFILE FROM THIS BUTTON -->
						<a href="EditProfile"
							class="btn btn-outline-dark btn-sm btn-block">Edit profile</a>
					</div>
					<div class="media-body mb-5 text-white">
						<h4 class="mt-0 mb-0">User Name here</h4>
						<p class="small mb-4">
							<i class="fas fa-map-marker-alt mr-2"></i>I am from here
						</p>
					</div>
				</div>
			</div>





			
			</div>
			<div class="py-4 px-4">
				<div class="d-flex align-items-center justify-content-between mb-3">
					<h5 class="mb-0">Recent photos</h5>
					<a href="#" class="btn btn-link text-muted">Show all</a>
				</div>
				<div class="row">
					<a href="showUsers.blade.php" type="button"
						class="btn btn-outline-dark">Show All Users</a>
					<button type="button" class="btn btn-outline-dark">Dark</button>
					<button type="button" class="btn btn-outline-dark">Dark</button>
					<button type="button" class="btn btn-outline-dark">Dark</button>

				</div>
			</div>
		</div>
		<div>
			<!-- DELETE THE USER -->
			<a href="#" class="btn btn-outline-dark btn-sm btn-block">Delete</a>
			<!-- SUSPEND THE USER -->
			<a href="#" class="btn btn-outline-dark btn-sm btn-block">Suspend</a>
		</div>
	</div>
<!-- </div> -->
@endsection
