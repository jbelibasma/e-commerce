<?php
session_start();
$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');
if(empty($_POST)){
    $template= 'inscrit.phtml';
    include 'layout.phtml';
}
else {
    $query = $dbh->prepare('SELECT `email` FROM `users` WHERE `email`=?');
    $query->execute([$_POST['email']]);
    $user= $query->fetch();
    if(!empty($user))
    {
       $message =  'email existant';
       include 'inscription.phtml';
        
    }

    $pasword = password_hash($_POST['password'],PASSWORD_DEFAULT);
    $query1 = $dbh->prepare('
    INSERT INTO `users`( `name`, `email`, `password`, `phone`, `address`) VALUES (?,?,?,?,?)');
    $name=$_POST['name'];
    $email=$_POST['email'];
    $password=$_POST['password'];
    $tel=$_POST['tel'];
    $adress=$_POST['adress'];


    $query1->execute([$name,$email,$pasword,$tel,$adress]);
    header('Location:index.php');
}









include "inscription.phtml";