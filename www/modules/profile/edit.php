<?php

$title = "Редактировать профиль";

$currentUser = $_SESSION['logged_user'];

$user = R::load('users', $currentUser->id);

if ( isset($_POST['profile-update']) ) {
	
	if ( trim($_POST['email']) == '' ) {
		$errors[] = ['title' => 'Введите Email' ];
	}

	if ( trim($_POST['name']) == '' ) {
		$errors[] = ['title' => 'Введите Имя' ];
	}

	if ( trim($_POST['surname']) == '' ) {
		$errors[] = ['title' => 'Введите Фамилию' ];
	}

	if ( empty($errors) ) {
		
		$user->name = htmlentities($_POST['name']);
		$user->surname = htmlentities($_POST['surname']);
		$user->email = htmlentities($_POST['email']);
		$user->country = htmlentities($_POST['country']);
		$user->city = htmlentities($_POST['city']);

		if ( isset($_FILES['avatar']['name']) && $_FILES['avatar']['tmp_name'] != "" ) {
			
			// Write file image params in variables
			$fileName = $_FILES['avatar']['name'];
			$fileTmpLoc = $_FILES['avatar']['tmp_name'];
			$fileType = $_FILES['avatar']['type'];
			$fileSize = $_FILES['avatar']['size'];
			$fileErrorMsg = $_FILES['avatar']['error'];
			$kaboom = explode(".", $fileName);
			$fileExt = end($kaboom);

			// Check file properties on different conditions
			list($width, $height) = getimagesize($fileTmpLoc);
			if ( $width < 10 || $height < 10 ) {
				$errors[] = ['title' => 'Изображение не имеет размеров. Загрузите изображение побольше.' ];
			}

			if ( $fileSize > 2097152 ) {
				$errors[] = ['title' => 'Файл изображения не должен быть более 2 Мбайт' ];
				// echo "Файл изображения не должен быть более 2 Мбайт";
			}

			if ( !preg_match("/\.(gif|jpg|jpeg|png)$/i", $fileName) ) {
				$errors[] = [
					'title' => 'Неверный формат файла', 
					'desc' => '<p>Файл изображения должен быть в формате gif, jpg, jpeg, или png.</p>' 
				];
			}

			if ( $fileErrorMsg == 1 ) {
				$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку' ];
			}

			if ( empty($errors) ) {

				// Проверяем установлен ли аватар у пользователя
				$avatar = $user['avatar'];
				$avatarFolderLocation = ROOT . 'usercontent/avatar/';
	
				// Если аватар уже установлен, то есть загружен ранее, то удаляем файл аватара
				if ( $avatar != '' ) {
					$picurl = $avatarFolderLocation . $avatar; // usercontent/avatar/oldfoto.jpg
					$picurl48 = $avatarFolderLocation . "48-" . $avatar; // usercontent/avatar/48-oldfoto.jpg
					// Удаляем аватар с помощью функции unlink()
					if ( file_exists($picurl) ) {
						unlink($picurl);
					}
					if ( file_exists($picurl48) ) {
						unlink($picurl48);
					}
				}
	
				// Перемещаем загруженный файл в нужную директорию
				// Для имени файла генерируется случайное число
				$db_file_name = rand(100000000000, 999999999999) . "." . $fileExt; // 9989234798.jpg
				$uploadfile = $avatarFolderLocation . $db_file_name;// usercontent/avatar/9989234798.jpg
				$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);
	
				if ( $moveResult != true ) {
					$errors[] = ['title' => 'Ошибка сохранения файла' ];
				}
	
				require_once(ROOT . "libs/image_resize_imagick.php");
	
				// Создаем большую аватарку
				$target_file = $avatarFolderLocation . $db_file_name;
				$wmax = 222;
				$hmax = 222;
				$img = createThumbnail($target_file, $wmax, $hmax);
				$img->writeImage($target_file);
	
				// Пишем в БД путь к большой аватарке
				$user->avatar = $db_file_name;
	
				// Создаем маленькую аватарку
				$target_file = $avatarFolderLocation . $db_file_name;
				$resized_file = $avatarFolderLocation . "48-" . $db_file_name;
				$wmax = 48;
				$hmax = 48;
				$img = createThumbnail($target_file, $wmax, $hmax);
				$img->writeImage($resized_file);
	
				// Пишем в БД путь к маленькой аватарке
				$user->avatarSmall = "48-" . $db_file_name;
			}

		}

		// Сохраняем данные пользователя
		R::store($user);
		// Записываем в сессию обновленного пользователя
		$_SESSION['logged_user'] = $user;
		header('Location: ' . HOST . "profile");
		exit();

	}

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/profile/profile-edit.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>