
<?php

$dbh = new PDO('mysql:host=localhost;dbname=eshop',
'root','');


$category = $dbh->prepare('SELECT `id`,COUNT(`category`) as count,`category`FROM `categories` GROUP BY `category` ');
$category->execute();
$categorys=$category->fetchAll();

include "category.phtml";