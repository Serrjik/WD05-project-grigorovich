<?php

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Работы - Редактировать работу";

$work = R::load('works', $_GET['id']);

if ( isset($_POST['workUpdate']) ) {

	if ( trim($_POST['title']) == '' ) {
		$errors[] = ['title' => 'Введите название работы' ];
	}

	if ( trim($_POST['text']) == '' ) {
		$errors[] = ['title' => 'Введите описание работы' ];
	}

	if ( trim($_POST['technology']) == '' ) {
		$errors[] = ['title' => 'Введите технологии, использованные в работе' ];
	}

	if ( empty($errors) ) {

		$work->title = htmlentities(trim($_POST['title']));
		$work->text = trim($_POST['text']);
		$work->result = trim($_POST['result']);
		$work->technology = trim($_POST['technology']);
		// $work->authorId = $_SESSION['logged_user']['id'];
		$work->updateTime = R::isoDateTime();
		$work->link = trim($_POST['link']);
		$work->github = trim($_POST['github']);

		// Сохранение изображения работы
		if ( isset($_FILES['workImage']['name']) && ($_FILES['workImage']['tmp_name'] != '') ) {

			// Write file image params in variables
			$fileName = $_FILES['workImage']['name'];
			$fileTmpLoc = $_FILES['workImage']['tmp_name'];
			$fileType = $_FILES['workImage']['type'];
			$fileSize = $_FILES['workImage']['size'];
			$fileErrorMsg = $_FILES['workImage']['error'];
			$kaboom = explode(".", $fileName);
			$fileExt = end($kaboom);

			if ( !preg_match("/\.(gif|jpg|jpeg|png)$/i", $fileName) ) {
				$errors[] = [
					'title' => 'Неверный формат файла', 
					'desc' => '<p>Файл изображения должен быть в формате gif, jpg, jpeg, или png.</p>' 
				];
			} else if ( $fileSize > 10485760 ) {
				$errors[] = ['title' => 'Файл изображения не должен быть более 10 Мбайт' ];
			} else if ( $fileErrorMsg == 1 ) {
				$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку' ];
			} else {
			// Check file properties on different conditions
				list($width, $height) = getimagesize($fileTmpLoc);
				if ( $width < 100 || $height < 100 ) {
					$errors[] = ['title' => 'Изображение не имеет размеров. Загрузите изображение побольше.' ];
				}
			}  

			if ( empty($errors) ) {

				// Перемещаем загруженный файл в нужную директорию
				// Для имени файла генерируется случайное число
				$db_file_name = rand(100000000000, 999999999999) . "." . $fileExt; // 9989234798.jpg
				$workImgFolderLocation = ROOT . 'usercontent/portfolio/'; // usercontent/portfolio/9989234798.jpg
				$uploadfile = $workImgFolderLocation . $db_file_name;
				$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

				// Удаляем файл прежней картинки работы
				$workImg = $work->work_image;
				if ( $workImg != '' ) {
					$picurl = $workImgFolderLocation . $workImg; // usercontent/portfolio/oldfoto.jpg
					$picurl360 = $workImgFolderLocation . "360-" . $workImg; // usercontent/portfolio/360-oldfoto.jpg
					// Удаляем картинку блога с помощью функции unlink()
					if ( file_exists($picurl) ) {
						unlink($picurl);
					}
					if ( file_exists($picurl360) ) {
						unlink($picurl360);
					}
				}

				if ( $moveResult != true ) {
					$errors[] = ['title' => 'Ошибка сохранения файла' ];
				}

				require_once(ROOT . "libs/image_resize_imagick.php");

				// Создаем большую картинку
				$target_file = $workImgFolderLocation . $db_file_name;
				$wmax = 950;
				$hmax = 3000;
				$img = createThumbnailBig($target_file, $wmax, $hmax);
				$img->writeImage($target_file);
				// Пишем в БД имя большой картинки
				$work->workImage = $db_file_name;

				// Создаем маленькую картинку
				$target_file = $workImgFolderLocation . $db_file_name;
				$resized_file = $workImgFolderLocation . "360-" . $db_file_name;
				$wmax = 360;
				$hmax = 190;
				$img = createThumbnailCrop($target_file, $wmax, $hmax);
				$img->writeImage($resized_file);
				// Пишем в БД имя маленькой картинки
				$work->workImageSmall = "360-" . $db_file_name;
			}
		}
		// - // Сохранение изображения работы

		if ( empty($errors) ) {

			R::store( $work );
			header('Location: ' . HOST . 'portfolio?result=workUpdated');
			// exit();

		}

	}

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/portfolio/work-edit.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>