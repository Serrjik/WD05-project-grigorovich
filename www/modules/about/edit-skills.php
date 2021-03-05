<?php

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Редактировать - Обо мне";

// паттерн для проверки целого положительного числа, которое не должно начинаться с нуля(ей), но может быть единственным нулем.
$pattern = "/^([1-9]{1}[0-9]*|(0))$/";
$skills = R::load('skills', 1);

if ( isset($_POST['skillsUpdate']) ) {

	foreach ($_POST as $index => $value) {

		if ( $index != 'skillsUpdate' ) {
			if ( !preg_match($pattern, trim($value)) ) {
				$errors[] = ['title' => "В поле $index должны быть введены только цифры!" ];
			} else if ( (intval(trim($value)) < 0) || (intval(trim($value)) > 100 ) ) {
				$errors[] = ['title' => "Введите целое число от 0 до 100 в поле $index" ];
			}
		}

	}

	if ( empty($errors) ) {

		// Создаём таблицу "skills" (только для первого запуска сайта)
		// $skills = R::dispense('skills');

		$skills->html = htmlentities(intval(trim($_POST['html'])));
		$skills->css = htmlentities(intval(trim($_POST['css'])));
		$skills->js = htmlentities(intval(trim($_POST['js'])));
		$skills->jquery = htmlentities(intval(trim($_POST['jquery'])));
		$skills->php = htmlentities(intval(trim($_POST['php'])));
		$skills->wp = htmlentities(intval(trim($_POST['wp'])));
		$skills->mysql = htmlentities(intval(trim($_POST['mysql'])));
		$skills->nodejs = htmlentities(intval(trim($_POST['nodejs'])));
		$skills->git = htmlentities(intval(trim($_POST['git'])));
		$skills->gulp = htmlentities(intval(trim($_POST['gulp'])));
		$skills->npm = htmlentities(intval(trim($_POST['npm'])));
		$skills->webpack = htmlentities(intval(trim($_POST['webpack'])));

		R::store($skills);
		header('Location: ' . HOST . "about#skills");
		exit();

	}

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/about/edit-skills.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>