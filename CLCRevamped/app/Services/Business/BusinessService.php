<?php
namespace App\Services\Business;

use App\Services\User\UserDAO;

class BusinessService
{
    
    private $VerifyCredit;
    
    // find by ID
    public function FindID($id)
    {
        $this->VerifyCredit = new UserDAO();
        
        return $this->VerifyCredit->FromID($id);
    }
    
    // Delete By User
    public function DeleteUser($credits)
    {
        $this->VerifyCredit = new UserDAO();
        
        return $this->VerifyCredit->DeleteUsername($credits);
    }
    
    // User is verified
    public function Verify($User)
    {
        $this->VerifyCredit = new UserDAO();
        
        return $this->VerifyCredit->VerifyUser($User);
    }
    
    // show everyone in the database
    public function ShowAll($users)
    {
        $this->VerifyCredit = new UserDAO();
        
        return $this->VerifyCredit->AllUsers($users);
    }
}
?>