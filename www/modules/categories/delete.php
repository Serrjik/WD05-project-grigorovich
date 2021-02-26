<?php

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Удалить категорию";

$cat = R::load('categories', $_GET['id']);

if ( isset($_POST['catDelete']) ) {

	$posts = R::findOne( 'posts', ' cat = ? ', [$_GET['id']] );

	if ( isset($posts->id) ) {
		$errors[] = [
			'title' => 'Категория не удалена!', 
			'desc' => '<p>Вы пытаетесь удалить категорию, с которой связаны посты в блоге.</p>' 
		];
	} else {
		R::trash($cat);
		header('Location: ' . HOST . "blog/categories?result=catDeleted");
		exit();
	}

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/categories/delete.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>