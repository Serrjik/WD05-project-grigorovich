<?php

$title = "Вход на сайт";

// email address matching pattern
$pattern = '/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i';

// Если форма отправлена - то делаем вход
if ( isset($_POST['login']) ) {

	if ( trim($_POST['email']) == '' ) {
		$errors[] = ['title' => 'Введите Email' ];
	} else if ( preg_match($pattern, $_POST['email']) !== 1 ) {
		$errors[] = ['title' => 'Введенный Email некорректный' ];
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

				// Возможно этот чекбокс приведёт к варианту работы корзины, который отличается от задуманного
				// Если будет сбрасываться переменная корзины в сессии
				// В PHP v. 5.6 не нужно убивать сессию для установки этих параметров
				if ( isset($_POST['rememberMe'])) {
					session_destroy();
					ini_set('session.gc_maxlifetime', 31104000); // 60*60*24*30*12 = 1 год
					ini_set('session.cookie_lifetime', 31104000);
					session_start();
				}

				$_SESSION['logged_user'] = $user;
				$_SESSION['role'] = $user->role;

				// Сравнение и обновление корзины вынесено в отдельный файл
				require ROOT . "modules/cart/_cart-update-in-login.php";

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