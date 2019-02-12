<?php

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Контакты";

// $cats = R::find('categories', 'ORDER BY cat_title ASC');

$contacts = R::load('contacts', 1);

if ( isset($_POST['contactsUpdate']) ) {

	// email address matching pattern
	$pattern = '/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i';

	if ( trim($_POST['name']) == '' ) {
		$errors[] = ['title' => 'Введите Имя' ];
	}

	if ( trim($_POST['surname']) == '' ) {
		$errors[] = ['title' => 'Введите Фамилию' ];
	}

	if ( trim($_POST['email']) == '' ) {
		$errors[] = ['title' => 'Введите Email' ];
	} else if ( preg_match($pattern, $_POST['email']) !== 1 ) {
		$errors[] = ['title' => 'Введенный Email некорректный' ];
	}

	if ( trim($_POST['phone']) == '' ) {
		$errors[] = ['title' => 'Введите Телефон' ];
	}

	if ( trim($_POST['address']) == '' ) {
		$errors[] = ['title' => 'Введите Адрес' ];
	}

	if ( empty($errors) ) {
		$contacts->email = htmlentities(trim($_POST['email']));
		$contacts->phone = htmlentities(trim($_POST['phone']));
		$contacts->address = htmlentities(trim($_POST['address']));
		$contacts->name = htmlentities(trim($_POST['name']));
		$contacts->surname = htmlentities(trim($_POST['surname']));
		$contacts->skype = htmlentities(trim($_POST['skype']));
		$contacts->vkontakte = htmlentities(trim($_POST['vkontakte']));
		$contacts->facebook = htmlentities(trim($_POST['facebook']));
		$contacts->github = htmlentities(trim($_POST['github']));
		$contacts->twitter = htmlentities(trim($_POST['twitter']));

		R::store($contacts);

		header('Location: ' . HOST . "contacts");
		exit();
	}

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/contacts/edit.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>