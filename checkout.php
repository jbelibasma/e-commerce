<?php

$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');
session_start();
$total=0;
$query2 = $dbh->prepare(' INSERT INTO `orders`(`user_id`, `total`, `created_at`) VALUES (?,NULL,now())');
$query2->execute([ $_SESSION['user_id']]);
$orderId=$dbh->lastInsertId();
// var_dump($_SESSION['user_id']);

if(!empty($_POST)){
   

$query3 = $dbh->prepare(' INSERT INTO `orderlines`( `order_id`, `product_id`,`quantity`,`prix`) VALUES (?,?,?,?)');

foreach($_POST['carts'] as $value){
$query3->execute([$orderId,$value['id'],$value['quantity'],$value['prix']]);
$total+=$value['quantity']*$value['prix'];


}

}
$query4 = $dbh->prepare(' 
UPDATE `orders` SET `total`=? WHERE `orders`.id=?');
$query4->execute([$total,$orderId]);
echo $orderId;



