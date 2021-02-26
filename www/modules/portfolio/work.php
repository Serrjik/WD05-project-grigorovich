<?php

// If you want a single bean instead of an array, use R::findOne()
// If no beans match the criteria, this function will return NULL. 
$work  = R::findOne( 'works', ' id = ? ', array($_GET['id']) );
$author = R::findOne( 'about', 1);

// Метод getCol() получает значения из таблицы только по 1 колонке
$worksId = R::getCol('SELECT id FROM works');
foreach ($worksId as $index => $id) {
	if ( $id == $work['id'] ) {
		@$nextId = $worksId[$index + 1];
		@$prevId = $worksId[$index - 1];
		break;
	}
}

$title = $work['title'];

// Готовим контент для центральной части
ob_start();
if ( isAdmin() ) {
	include ROOT . 'templates/_parts/_admin-panel.tpl';
}
require ROOT . "templates/portfolio/works-work.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>