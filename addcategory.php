<?php
$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');
if(!empty($_POST)){
$category = $dbh->prepare('INSERT INTO `categories`(`id`, `category`) VALUES (?,?)
');
$category->execute([$_POST['id'],$_POST['category']]);
header('location:category.php');
exit();
}

$category = $dbh->prepare('SELECT `id`,`category`FROM `categories`  ');
$category->execute();
$categorys=$category->fetchAll();

include "addcategory.phtml";


