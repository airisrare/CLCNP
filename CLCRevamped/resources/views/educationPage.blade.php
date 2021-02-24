@extends('layouts.app')


@section('content')


<h1>>Hello! This the Education Listings! Here an admin can create a new educator and do stuff</h1>
<table class="table">
    <thead>
        <tr>
            <th scope="col">Campus Name</th>
            <th scope="col">GPA</th>
            <th scope="col">Degree</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">1</th>
            <td>GCU</td>
            <td>3.02</td>
            <td>Masters</td>
            <td><button type="button" class="btn btn-danger">Edit Education</button></td>
            <td><button type="button" class="btn btn-warning">Delete Posting</button></td>
            <td><button type="button" class="btn btn-warning">Suspend Posting</button></td>
        </tr>
    </tbody>
</table>

@endsection
