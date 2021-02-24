<?php
?>
@extends('layouts.app')


@section('content')


<h1>>Hello! This the Job posting page! We should be able to edit and Delete job posting here as an Admin!</h1>
<table class="table">
    <thead>
        <tr>
            <th scope="col">Company Name</th>
            <th scope="col">Title</th>
            <th scope="col">Salary</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Apple</td>
            <td>Cellular Design Specialist</td>
            <td>$ 100,000</td>
            <td><button type="button" class="btn btn-danger">Edit Job Posting</button></td>
            <td><button type="button" class="btn btn-warning">Delete Posting</button></td>
            <td><button type="button" class="btn btn-warning">Close job Posting</button></td>
            <td><button type="button" class="btn btn-warning">See whos applied</button></td>
        </tr>
    </tbody>
</table>

@endsection

