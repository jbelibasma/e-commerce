<?php
session_start();
$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');
$query2 = $dbh->prepare(' SELECT * FROM `products` ORDER BY `created_at` DESC LIMIT 3 ');
$query2->execute();
$products=$query2->fetchAll();


$query1 = $dbh->prepare(' SELECT `id`,`category_id`,`nom`,`prix`,`image`,`created_at` FROM `products` ORDER BY `prix` ASC LIMIT 6 ');
$query1->execute();
$prixdesc=$query1->fetchAll();
include "index.phtml";


