<?php

$title = "Блог - пост";

// If you want a single bean instead of an array, use R::findOne()
// If no beans match the criteria, this function will return NULL. 
$post  = R::findOne( 'posts', ' id = ? ', array($_GET['id']) );

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/blog/blog-post.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>