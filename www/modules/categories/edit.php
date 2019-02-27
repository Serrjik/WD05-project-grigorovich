<?php

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Редактировать категорию";

$cat = R::load('categories', $_GET['id']);

if ( isset($_POST['catEdit']) ) {
	
	if ( trim($_POST['catTitle']) == '' ) {
		$errors[] = ['title' => 'Введите Название категории' ];
	} else {

		$sameCategory = R::findOne( 'categories', 'cat_title = ? ', [ trim($_POST['catTitle']) ] );
		$sameCategoryName = $sameCategory['catTitle'];

		if ( $sameCategoryName != '' ) {
			$errors[] = ['title' => 'Такая категория уже существует' ];
		}
		
	}

	if ( empty($errors) ) {
		$cat->cat_title = htmlentities(trim($_POST['catTitle']));
		R::store($cat);
		header('Location: ' . HOST . "blog/categories?result=catUpdated");
		exit();
	}

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/categories/edit.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>