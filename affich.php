<?php
session_start();
$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');
$query2 = $dbh->prepare(' SELECT `nom`,`quantity`,(`products`.`prix`) as price,`total` FROM `orderlines`  
INNER JOIN `products` ON `products`.`id`=`orderlines`.`product_id` 
INNER JOIN `orders` on `orders`.`id`=`orderlines`.`order_id` WHERE `order_id` =? ');
$query2->execute([$_GET['new_sale']]);
$affichOrder=$query2->fetchAll();


include "checkout.phtml";


