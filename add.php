<?php

$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');
$category = $dbh->prepare('SELECT `category`,`id` FROM `categories` ');
$category->execute();
$categorys = $category->fetchAll();

if(!empty($_POST))
{
$products = $dbh->prepare('INSERT INTO `products`( `category_id`, `nom`, `couleur`, `size`, `genre`, `prix`, `description`, `image`, `created_at`)
 VALUES (?,?,?,?,?,?,?,?,now())');
$target_dir = "imgs/";
$name = time().$_FILES["file"]["name"];
 $target_file = $target_dir . $name;
 move_uploaded_file($_FILES["file"]["tmp_name"], $target_file);
 
$products->execute([$_POST['category'],$_POST['name'],$_POST['couleur'],$_POST['size'],$_POST['genre'],$_POST['prix'], $_POST['description'],$name]);

header('Location:admin.php');
exit();
}
include "add.phtml";
