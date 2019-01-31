<?php

$title = "Регистрация";

// Если форма отправлена - то делаем регистрацию
if ( isset($_POST['register']) ) {
	// echo "<pre>";
	// print_r($_POST);
	// echo "</pre>";

	if ( trim($_POST['email']) == '' ) {
		$errors[] = ['title' => 'Введите Email', 'desc' => '<p>Email обязателен для регистрации на сайте</p>' ];
	}

	if ( trim($_POST['password']) == '' ) {
		$errors[] = ['title' => 'Введите Пароль' ];
	}

	// Проверка на то что пользователь уже существует
	// Функция R::count() возвращает количество найденных записей
	// R::count(в_какой_таблице_искать, поле_которое_соответствует_определенному_значению, требуемое_значение)
	if ( R::count('users', 'email = ?', array($_POST['email']) ) ) {
		$errors[] = [
			'title' => 'Пользователь с таким email уже зарегистрирован', 
			'desc' => '<p>Используйте другой email адрес, или воспользуйтесь восстановлением пароля.</p>' 
		];
	}

	if ( empty($errors) ) {
		// Alright, Register!
		$user = R::dispense('users');
		$user->email = htmlentities($_POST['email'], ENT_QUOTES);
		$user->role = 'user';
		$user->password = password_hash($_POST['password'], PASSWORD_DEFAULT);
		R::store($user);

		$_SESSION['logged_user'] = $user;
		$_SESSION['role'] = $user->role;

		header('Location: ' . HOST . "profile-edit");
		exit();

	}

}

// Готовим контент для центральной части
ob_start();
require ROOT . "templates/login/form-registration.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'templates/_parts/_head.tpl';
require ROOT . "templates/login/login-page.tpl";
include ROOT . 'templates/_parts/_foot.tpl';

?>