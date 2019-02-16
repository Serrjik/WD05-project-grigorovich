<?php

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}
// Редактирование информации об одном месте работы
$title = "Редактировать место работы";

$job = R::load('jobs', $_GET['id']);

if ( isset($_POST['editJob']) ) {

	if ( trim($_POST['period']) == '' ) {
		$errors[] = ['title' => 'Введите период работы' ];
	}

	if ( trim($_POST['title']) == '' ) {
		$errors[] = ['title' => 'Введите должность' ];
	}

	if ( empty($errors) ) {
		$job->period = htmlentities(trim($_POST['period']));
		$job->title = htmlentities(trim($_POST['title']));
		$job->description = htmlentities(trim($_POST['description']));

		R::store($job);
		header('Location: ' . HOST . "edit-jobs?result=jobUpdated");
	}

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/about/edit-job.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>