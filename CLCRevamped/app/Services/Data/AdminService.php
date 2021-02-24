<?php
namespace App\Services\Data;

use App\User;
use Carbon\Exceptions\Exception;

class AdminService
{

    private $conn;

    private $servername = "localhost";
    private $username = "root";
    private $password = "root";
    private $dbname = "cst256";
    private $port = "3306";
    private $dbQuery;

    public function __construct()
    {
        // connect to the database
        $this->conn = mysqli_connect($this->servername, $this->username, $this->password, $this->dbname);
    }

    function FindByUserName(User $credits)
    {
        try {
            // define the query and DB, we want to grab All members from the database
            $this->dbQuery = " SELECT userName, password , email FROM user WHERE userName = '{$credits->getUserName()}' AND password = '{$credits->getPassword()}' AND email = '{$credits->getemail()}' ";
            $result = mysqli_query($this->conn, $this->dbQuery);
            // check rows that are there, if we dont have any then punch out a null, if we do show the users
            if (mysqli_num_rows($result) > 0) {

                mysqli_free_result($result);
                mysqli_close($this->conn);
                return true;
            } else {

                mysqli_free_result($result);
                mysqli_close($this->conn);
                return false;
            }
            // catch e, show the errors please!
        } catch (Exception $e) {
            $e->getMessage();
        }
    }
}

