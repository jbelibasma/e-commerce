<?php
session_start();
$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');
$category = $dbh->prepare('SELECT `category`,`id` FROM `categories` ');
$category->execute();
$categorys = $category->fetchAll();

if(!empty($_POST)){
$modiffproduct = $dbh->prepare('UPDATE `products` SET `category_id`=?,`nom`=?,`couleur`=?,`size`=?,`genre`=?,`prix`=?,`description`=?,`image`=? WHERE id=?');

$target_dir = "imgs/";
$name = time().$_FILES["file"]["name"];
 $target_file = $target_dir . $name;
 move_uploaded_file($_FILES["file"]["tmp_name"], $target_file);
$modiffproduct->execute([$_POST['category'],$_POST['name'],$_POST['couleur'],$_POST['size'],$_POST['genre'],$_POST['prix'], $_POST['description'],$name,$_POST['id']]);
header('location:admin.php');
exit();
}
$idmodiff=$_GET['idmodiff'];
$product = $dbh->prepare('SELECT `products`.`id`,`category`, `category_id`,`nom`,`couleur`,`size`,`genre`,`prix`,`description`,`image`,`created_at`
 FROM `products` INNER JOIN `categories` ON `products`.`category_id`=`categories`.`id`
WHERE `products`.`id`=? ');
$product->execute([$idmodiff]);
$allproducts = $product->fetch();



include "modifier.phtml";


