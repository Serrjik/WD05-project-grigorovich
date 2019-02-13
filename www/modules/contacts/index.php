<?php

$title = "Контакты";

$contacts = R::load('contacts', 1);

if ( isset($_POST['newMessage'])) {
	
	// email address matching pattern
	$pattern = '/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i';

	if ( trim($_POST['name']) == '' ) {
		$errors[] = ['title' => 'Введите Имя' ];
	}

	if ( trim($_POST['email']) == '' ) {
		$errors[] = ['title' => 'Введите Email' ];
	} else if ( preg_match($pattern, $_POST['email']) !== 1 ) {
		$errors[] = ['title' => 'Введенный Email некорректный' ];
	}

	if ( trim($_POST['message']) == '' ) {
		$errors[] = ['title' => 'Введите Сообщение' ];
	}

	// Загрузка файла
	if ( isset($_FILES['file']['name']) && $_FILES['file']['tmp_name'] != "" ) {

		// Write file image params in variables
		$fileName = $_FILES['file']['name'];
		$fileTmpLoc = $_FILES['file']['tmp_name'];
		$fileType = $_FILES['file']['type'];
		$fileSize = $_FILES['file']['size'];
		$fileErrorMsg = $_FILES['file']['error'];
		$kaboom = explode(".", $fileName);
		$fileExt = end($kaboom);

		if ( !preg_match("/\.(jpg|jpeg|png|pdf|doc|docx)$/i", $fileName) ) {
			$errors[] = [
				'title' => 'Неверный формат файла', 
				'desc' => '<p>Файл изображения должен быть в формате jpg, jpeg, png, pdf, doc или docx.</p>' 
			];
		} else if ( $fileSize > 2097152 ) {
			$errors[] = ['title' => 'Файл не должен быть более 2 Мбайт' ];
		} else if ( $fileErrorMsg == 1 ) {
			$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку' ];
		}

		if ( preg_match("/\.(jpg|jpeg|png)$/i", $fileName) ) {
			// Check file properties on different conditions
			list($width, $height) = getimagesize($fileTmpLoc);
			if ( $width < 10 || $height < 10 ) {
				$errors[] = ['title' => 'Изображение не имеет размеров. Загрузите изображение побольше.' ];
			}
		}

		if ( empty($errors) ) {
			// Перемещаем загруженный файл в нужную директорию
			// Для имени файла генерируется случайное число
			$db_file_name = rand(100000000000, 999999999999) . "." . $fileExt; // 9989234798.jpg
			$postImgFolderLocation = ROOT . 'usercontent/upload_files/'; // usercontent/upload_files/9989234798.jpg
			$uploadfile = $postImgFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			if ( $moveResult != true ) {
				$errors[] = ['title' => 'Ошибка сохранения файла' ];
			}

		}

	}
	// - // Загрузка файла

	if ( empty($errors) ) {
		
		$message = R::dispense('messages');
		$message->email = htmlentities($_POST['email']);
		$message->name = htmlentities($_POST['name']);
		$message->message = htmlentities($_POST['message']);
		$message->dateTime = R::isoDateTime();
		$message->message_file_name_original = (@$fileName !== NULL ) ? $fileName : '';
		$message->message_file = (@$db_file_name !== NULL ) ? $db_file_name : '';

		R::store($message);

		$success[] = ['title' => 'Сообщение было успешно отправлено!' ];

	}

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/contacts/contacts.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>