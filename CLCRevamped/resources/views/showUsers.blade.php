<?php
?>
@extends('layouts.app')


@section('content')



<table class="table">
    <thead>
        <tr>
            <th scope="col">User ID</th>
            <th scope="col">Name</th>
            <th scope="col">Username</th>
            <th scope="col">Password</th>
            <th scope="col">Email</th>
            <th scope="col">Role</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>OttoMan</td>
            <td>Password</td>
            <td>Email</td>
            <td>Role</td>
           
            <td><button type="button" class="btn btn-danger">Edit Profile</button></td>
            <td><button type="button" class="btn btn-warning">Delete User</button></td>
            <td><button type="button" class="btn btn-warning">Suspend User</button></td>
        </tr>
        <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td>Larry</td>
            <td>the Bird</td>
            <td>@twitter</td>
        </tr>
    </tbody>
</table>



@endsection
