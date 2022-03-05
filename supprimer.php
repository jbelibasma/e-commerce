<?php
$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');
$id=$_GET['idsupp'];
$products = $dbh->prepare('DELETE FROM `products` WHERE `id`=?');
$products->execute([$id]);

header('location:admin.php');
exit();