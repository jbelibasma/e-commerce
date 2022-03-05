<?php
session_start();
$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');
$query2 = $dbh->prepare(' SELECT * FROM `products` ');
$query2->execute();
$shops=$query2->fetchAll();

$query2 = $dbh->prepare('SELECT `category`,`id` FROM `categories` 
');
$query2->execute();
$categorys=$query2->fetchAll();


include "shop.phtml";