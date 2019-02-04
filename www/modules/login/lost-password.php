<?php

if ( isset($_POST['lost-password'])) {
	
	if ( trim($_POST['email']) == '' ) {
		$errors[] = ['title' => 'Введите Email' ];
	}

	// email address matching pattern
	$pattern = '/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i';

	if ( preg_match($pattern, trim($_POST['email'])) !== 1 ) {
		$errors[] = ['title' => 'Введенный Email некорректный' ];
	}

	if ( empty($errors) ) {
		
		$user = R::findOne('users', 'email = ?', array($_POST['email']) );

		if ( $user ) {

			// Генерация кода и сохранение кода в БД
			function random_str( $num = 30 ) {
				// substr — Возвращает подстроку строки string, начинающейся с start символа по счету и длиной length символов.
				// str_shuffle — Переставляет символы в строке случайным образом
				return substr(str_shuffle('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, $num);
			}

			$recovery_code = random_str(15);
			$user->recovery_code = $recovery_code;
			$user->recovery_code_times = 3;
			R::store($user);

			// Высылаем инструкции на почту
			$recovery_message = "<p>Код для сброса пароля: <b>$recovery_code</b></p>";
			$recovery_message .= "<p>Для сброса пароля перейдите по ссылке ниже, и установите новый пароль:</p>";
			$recovery_message .= '<p><a href="' . HOST;
			$recovery_message .= "set-new-password?email=" . $_POST['email'] . "&code=" . $recovery_code;
			$recovery_message .= '" target="_blank">';
			$recovery_message .= "Установить новый пароль</a></p>";

			$headers = "MIME-Version: 1.0" . PHP_EOL .
						"Content-Type: text/html; charset=utf-8" . PHP_EOL .
						"From:" . adopt( SITE_NAME ) . "<" . SITE_EMAIL . ">" . PHP_EOL .
						"Reply-To: " . ADMIN_EMAIL;

			mail($_POST['email'], 'Восстановление доступа', $recovery_message, $headers);

			$success[] = [
				'title' => 'Всё отлично',
				'desc' => "<p>Инструкции по восстановлению доступа высланы на {$_POST['email']}</p>"
			];

		} else {
			$errors[] = ['title' => 'Пользователь с таким Email не зарегистрирован' ];
		}

	}

}

// Готовим контент для центральной части
ob_start();
require ROOT . "templates/login/form-lost-password.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'templates/_parts/_head.tpl';
require ROOT . "templates/login/login-page.tpl";
include ROOT . 'templates/_parts/_foot.tpl';

?>