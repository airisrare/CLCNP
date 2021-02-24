<?php
namespace App\Services\User;

//use App\Models\User;
//use App\Services\Generic\DBConnector;
use Carbon\Exceptions\Exception;
use Illuminate\Queue\Connectors\DatabaseConnector;
use App\Services\User;

class UserDAO
{
    
    public static function AllUsers()
    {
        $conn = DatabaseConnector::GetConnection();
        
        if ($conn->connect_error) {
            echo ("Connection failed: " . $conn->connect_error);
            return None;
        }
        
        try {
            $query = "SELECT user_id, username, email, date_joined, is_admin FROM User";
            $result = $conn->query($query);
            
            $users = array();
            
            while ($row = $result->fetch_assoc()) {
                $user_id = $row['user_id'];
                $username = $row['username'];
                $email = $row['email'];
                $date_joined = $row['date_joined'];
                $is_admin = $row['is_admin'];
                
                $users[] = new User($user_id, $username, False, $email, $date_joined, $is_admin);
                ;
            }
            
            mysqli_free_result($result);
            
            DatabaseConnector::CloseConnection($conn);
            
            return $users;
        }
        catch (Exception $e) {
            echo $e->getMessage();
            return None;
        }
    }
    
    public static function FromID($id)
    {
        $conn = DatabaseConnector::GetConnection();
        
        if ($conn->connect_error) {
            echo ("Connection failed: " . $conn->connect_error);
            return None;
        }
        
        try {
            $query = "SELECT username, email, date_joined, is_admin FROM User WHERE user_id=?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('i', $id);
            
            $stmt->execute();
            $stmt->store_result();
            $stmt->bind_result($username, $email, $date_joined, $is_admin);
            $stmt->fetch();
            
            $user = new User($id, $username, False, $email, $date_joined, $is_admin);
            
            DatabaseConnector::CloseConnection($conn);
            
            return $user;
        } catch (Exception $e) {
            echo $e->getMessage();
            return None;
        }
    }
    
    public static function DeleteUsername(string $username)
    {
        $conn = DatabaseConnector::GetConnection();
        
        if ($conn->connect_error) {
            echo ("Connection failed: " . $conn->connect_error);
            return None;
        }
        
        try {
            $query = "DELETE user_id, email, date_joined, is_admin FROM User WHERE username=?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('s', $username);
            
            $stmt->execute();
            $stmt->store_result();
            $stmt->bind_result($user_id, $email, $date_joined, $is_admin);
            $stmt->fetch();
            
            $user = new User($user_id, $username, False, $email, $date_joined, $is_admin);
            
            DatabaseConnector::CloseConnection($conn);
            
            return $user;
        } catch (Exception $e) {
            echo $e->getMessage();
            return None;
        }
    }
    
    public static function VerifyUser(string $username, string $password)
    {
        $conn = DatabaseConnector::GetConnection();
        
        if ($conn->connect_error) {
            echo ("Connection failed: " . $conn->connect_error);
            return False;
        }
        
        try {
            $query = "SELECT password FROM User WHERE username=?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('s', $username);
            
            $stmt->execute();
            $stmt->store_result();
            $stmt->bind_result($stored_password);
            $stmt->fetch();
            
            $success = password_verify($password, $stored_password);
            
            DatabaseConnector::CloseConnection($conn);
            
            return $success;
        } catch (Exception $e) {
            echo $e->getMessage();
            return False;
        }
    }
    
    public static function UserExists(string $username)
    {
        $conn = DatabaseConnector::GetConnection();
        
        if ($conn->connect_error) {
            echo ("Connection failed: " . $conn->connect_error);
            return False;
        }
        
        try {
            $query = "SELECT COUNT(1) FROM User WHERE username=?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('s', $username);
            
            $stmt->execute();
            $stmt->store_result();
            $stmt->bind_result($user_exists);
            $stmt->fetch();
            
            DatabaseConnector::CloseConnection($conn);
            
            return $user_exists;
        } catch (Exception $e) {
            echo $e->getMessage();
            return False;
        }
    }
    
    public static function CreateUser(string $username, string $password, string $email)
    {
        $conn = DatabaseConnector::GetConnection();
        
        if ($conn->connect_error) {
            echo ("Connection failed: " . $conn->connect_error);
            return False;
        }
        
        try {
            $query = "INSERT INTO User (username, password, email) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('sss', $username, $password, $email);
            
            $success = $stmt->execute();
            
            DatabaseConnector::CloseConnection($conn);
            
            return $success;
        } catch (Exception $e) {
            echo $e->getMessage();
            return False;
        }
    }
    
    public static function MakeAdmin (string $username) {
        $conn = DatabaseConnector::GetConnection();
        
        if ($conn->connect_error) {
            echo ("Connection failed: " . $conn->connect_error);
            return False;
        }
        
        try {
            $query = "UPDATE User SET is_admin = TRUE WHERE username=?";
            $stmt  = $conn->prepare ($query);
            $stmt->bind_param ('s', $username);
            
            $success = $stmt->query ();
            
            DatabaseConnector::CloseConnection($conn);
            
            return $success;
        }
        
        catch (Exception $e) {
            echo $e->getMessage();
            return False;
        }
    }
}

