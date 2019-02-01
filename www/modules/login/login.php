<?php

$title = "Вход на сайт";

// Если форма отправлена - то делаем вход
if ( isset($_POST['login']) ) {
	// echo "<pre>";
	// print_r($_POST);
	// echo "</pre>";

	if ( trim($_POST['email']) == '' ) {
		$errors[] = ['title' => 'Введите Email' ];
	}

	if ( trim($_POST['password']) == '' ) {
		$errors[] = ['title' => 'Введите Пароль' ];
	}

	if ( empty($errors) ) {

		// If you want a single bean instead of an array, use R::findOne()
		// If no beans match the criteria, this function will return NULL. 
		$user  = R::findOne( 'users', ' email = ? ', array($_POST['email']) );

		// test@test.com, password - 1
		if ( $user ) {
			if ( password_verify( $_POST['password'], $user->password) ) {
				$_SESSION['logged_user'] = $user;
				$_SESSION['role'] = $user->role;
				header('Location: ' . HOST);
				exit();
			} else {
				$errors[] = ['title' => 'Пароль введен неверно' ];
			}
		} else {
			$errors[] = ['title' => 'Пользователь с таким email не зарегистрирован на сайте' ];
		}

	}

}

// Готовим контент для центральной части
ob_start();
require ROOT . "templates/login/form-login.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'templates/_parts/_head.tpl';
require ROOT . "templates/login/login-page.tpl";
include ROOT . 'templates/_parts/_foot.tpl';

?>