<?php
$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');
$idsupprime=$_GET['idsupprime'];
$category = $dbh->prepare('DELETE FROM `categories` WHERE id=?
');
$category->execute([$idsupprime]);
header('location:category.php');
exit();

