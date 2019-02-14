<?php

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Редактировать - Обо мне";

$about = R::load('about', 1);

if ( isset($_POST['textUpdate']) ) {

	if ( trim($_POST['name']) == '' ) {
		$errors[] = ['title' => 'Введите Имя и Фамилию' ];
	}

	if ( trim($_POST['description']) == '' ) {
		$errors[] = ['title' => 'Введите описание' ];
	}

	if ( isset($_FILES['photo']['name']) && $_FILES['photo']['tmp_name'] != "" ) {

		// Write file image params in variables
		$fileName = $_FILES['photo']['name'];
		$fileTmpLoc = $_FILES['photo']['tmp_name'];
		$fileType = $_FILES['photo']['type'];
		$fileSize = $_FILES['photo']['size'];
		$fileErrorMsg = $_FILES['photo']['error'];
		$kaboom = explode(".", $fileName);
		$fileExt = end($kaboom);

		if ( !preg_match("/\.(gif|jpg|jpeg|png)$/i", $fileName) ) {
			$errors[] = [
				'title' => 'Неверный формат файла', 
				'desc' => '<p>Файл изображения должен быть в формате gif, jpg, jpeg, или png.</p>' 
			];
		} else if ( $fileSize > 2097152 ) {
			$errors[] = ['title' => 'Файл изображения не должен быть более 2 Мбайт' ];
		} else if ( $fileErrorMsg == 1 ) {
			$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку' ];
		} else {
			// Check file properties on different conditions
			list($width, $height) = getimagesize($fileTmpLoc);
			if ( $width < 100 || $height < 100 ) {
				$errors[] = ['title' => 'Размеры изображения меньше 100х100 пикселей. Загрузите изображение побольше.' ];
			}
		}  

		if ( empty($errors) ) {

			// Перемещаем загруженный файл в нужную директорию
			// Для имени файла генерируется случайное число
			$db_file_name = rand(100000000000, 999999999999) . "." . $fileExt; // 9989234798.jpg
			$postImgFolderLocation = ROOT . 'usercontent/about/'; // usercontent/about/9989234798.jpg
			$uploadfile = $postImgFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			if ( $moveResult != true ) {
				$errors[] = ['title' => 'Ошибка сохранения файла' ];
			}

			require_once(ROOT . "libs/image_resize_imagick.php");

			// Создаем картинку
			$target_file = $postImgFolderLocation . $db_file_name;
			$wmax = 205;
			$hmax = 205;
			$img = createThumbnail($target_file, $wmax, $hmax);
			$img->writeImage($target_file);

			// Пишем в БД имя картинки
			$about->photo = (@$db_file_name !== NULL ) ? $db_file_name : '';

		}

	}

	if ( empty($errors) ) {

		// Создаём таблицу "about" (только для 1-го запуска сайта)
		// $about = R::dispense('about');

		$about->name = htmlentities(trim($_POST['name']));
		$about->description = trim($_POST['description']);

		R::store($about);
		header('Location: ' . HOST . "about");
		exit();

	}

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/about/edit-text.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>