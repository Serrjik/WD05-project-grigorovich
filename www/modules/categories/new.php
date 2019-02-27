<?php

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Создать новую категорию";

if ( isset($_POST['catNew']) ) {
	
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
		$cat = R::dispense('categories');
		$cat->cat_title = htmlentities(trim($_POST['catTitle']));
		R::store($cat);
		header('Location: ' . HOST . "blog/categories?result=catCreated");
		exit();
	}

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/categories/new.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>