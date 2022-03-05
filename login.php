<?php
$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');
if(empty($_POST))
{
    include 'login.phtml';
}
else{


if(isset($_POST['email']) && isset($_POST['password'])){
$query1 = $dbh->prepare('SELECT * FROM `users` WHERE `email`=? ');
$query1->execute([$_POST['email']]);
$user = $query1->fetch();

    if(!empty($user))
    {
        $pwd = $_POST['password'];
       
       if(password_verify($pwd,$user['password']) == false)
       {
        $message =  'mot de passe incoreecte';
       
        include 'connexion.phtml';
       }
       session_start();
       $_SESSION['user_id'] = $user['id'];
       $_SESSION['email'] = $user['email'];
       $_SESSION['nom'] = $user['name'];
       $_SESSION['roles'] = $user['roles'];

       //$_SESSION['userconnectd'] = 'isconnected';
    //    echo $_SESSION['userconnectd'];
    //    die;
        if($_SESSION['roles']==0){
        header('Location:index.php');
        }
        elseif(($_SESSION['roles']==1)){
            header('Location:admin.php');

        }
    }
    else
    {
        $message =  'email incoreecte';
        include 'login.phtml';
    }
}
}



