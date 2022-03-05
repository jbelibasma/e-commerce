<?php
session_start();
$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');
$id=$_GET['idrecup'];
$query2 = $dbh->prepare(' SELECT `nom`,`id`,`prix`,`description`,`image`FROM `products` WHERE `id`=? ');
$query2->execute([$id]);
$product=$query2->fetch();
$id=$_GET['idrecup'];
$query2 = $dbh->prepare(' SELECT `nom`,`id`,`prix`,`description`,`image`FROM `products` WHERE `id`=? ');
$query2->execute([$id]);
$prixdesc=$query2->fetch();

include "details.phtml";