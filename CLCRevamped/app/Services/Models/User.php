<?php

namespace App\Services\Models;

use Carbon\Traits\Date;

class User {
    private $userId = null;
    
    private $Name;
    
    private $lastName;
    
    private $username;
    
    private $password;
    
    private $email;
    
    private $role = null;
    
    private $isSuspended = null;
    
    // constructor method
    public function __construct($id, $uname, $pswd, $name, $email, $role, $suspended)
    {
        $this->userId = $id;
        $this->username = $uname;
        $this->password = $pswd;
        $this->Name = $name;
        $this->email = $email;
        $this->role = $role;
        $this->isSuspended = $suspended;
    }
    
    public function getId()
    {
        return $this->userId;
    }
    
    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->Name;
    }

    /**
     * @param mixed $Name
     */
    public function setName($Name)
    {
        $this->Name = $Name;
    }

    public function getUsername()
    {
        return $this->username;
    }
    
    public function getPassword()
    {
        return $this->password;
    }
    
    public function getEmail()
    {
        return $this->email;
    }
    
    public function getRole()
    {
        return $this->role;
    }
    
    public function getStatus()
    {
        return $this->isSuspended;
    }
    
    public function toString()
    {
        return " User Id: " . $this->userId . " | Username: " . $this->username . " | Password: " . $this->password . " | firstName: " . $this->firstName . " | lastName: " . $this->lastName . " | email: " . $this->email . " | role: " . $this->role . " | isSuspnded: " . $this->isSuspended;
    }
    
 
}