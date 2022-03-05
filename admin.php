<?php

$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');
$products = $dbh->prepare('SELECT `category_id`,`id`,`nom`,`image`,`prix`,`description`,`created_at` FROM `products` 
');
$products->execute();
$allproducts = $products->fetchAll();


include "admin.phtml";