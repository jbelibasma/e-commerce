<?php
session_start();
$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');

if(!empty($_POST)){
$categorys = $dbh->prepare('UPDATE `categories` SET `category`=? WHERE id=?');
$categorys->execute([$_POST['category'],$_POST['id']]);
header('location:category.php');
exit();
}
$idmodiff=$_GET['idchang'];
$category = $dbh->prepare('SELECT `id`,`category` FROM `categories`  WHERE id=?');
$category->execute([$idmodiff]);
$categorys=$category->fetch();

include "modiffcateg.phtml";
