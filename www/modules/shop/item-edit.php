<?php

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Редактировать товар";

$item = R::load('goods', $_GET['id']);

if ( isset($_POST['itemUpdate']) ) {

	if ( trim($_POST['title']) == '' ) {
		$errors[] = ['title' => 'Введите Название товара' ];
	}

	if ( trim($_POST['price']) == '' ) {
		$errors[] = ['title' => 'Введите Стоимость товара' ];
	}

	if ( empty($errors) ) {

		$item->title = htmlentities(trim($_POST['title']));
		$item->price = htmlentities(trim($_POST['price']));
		$item->priceOld = htmlentities(trim($_POST['priceOld']));
		$item->desc = $_POST['desc'];

		// Загрузка картинки на хостинг
		if ( isset($_FILES['itemImg']['name']) && $_FILES['itemImg']['tmp_name'] != "" ) {

			// Write file image params in variables
			$fileName = $_FILES['itemImg']['name'];
			$fileTmpLoc = $_FILES['itemImg']['tmp_name'];
			$fileType = $_FILES['itemImg']['type'];
			$fileSize = $_FILES['itemImg']['size'];
			$fileErrorMsg = $_FILES['itemImg']['error'];
			$kaboom = explode(".", $fileName);
			$fileExt = end($kaboom);

			if ( !preg_match("/\.(gif|jpg|jpeg|png)$/i", $fileName) ) {
				$errors[] = [
					'title' => 'Неверный формат файла', 
					'desc' => '<p>Файл изображения должен быть в формате gif, jpg, jpeg, или png.</p>' 
				];
			} else if ( $fileSize > 4194304 ) {
				$errors[] = ['title' => 'Файл изображения не должен быть более 4 Мбайт' ];
			} else if ( $fileErrorMsg == 1 ) {
				$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку' ];
			} else {
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
				$postImgFolderLocation = ROOT . 'usercontent/shop/'; // usercontent/shop/9989234798.jpg
				$uploadfile = $postImgFolderLocation . $db_file_name;
				$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

				// Если картинка в блоге уже установлена, то есть загружена ранее, то удаляем её файл
				$postImg = $item->img;
				if ( $postImg != '' ) {
					$picurl = $postImgFolderLocation . $postImg; // usercontent/shop/oldfoto.jpg
					$picurl320 = $postImgFolderLocation . "320-" . $postImg; // usercontent/shop/320-oldfoto.jpg
					// Удаляем картинку блога с помощью функции unlink()
					if ( file_exists($picurl) ) {
						unlink($picurl);
					}
					if ( file_exists($picurl320) ) {
						unlink($picurl320);
					}
				}

				if ( $moveResult != true ) {
					$errors[] = ['title' => 'Ошибка сохранения файла' ];
				}

				require_once(ROOT . "libs/image_resize_imagick.php");

				// Создаем большую картинку
				$target_file = $postImgFolderLocation . $db_file_name;
				$wmax = 920;
				$hmax = 620;
				$img = createThumbnailCropNew($target_file, $wmax, $hmax);
				$img->writeImage($target_file);
				// Пишем в БД имя большой картинки
				$item->img = $db_file_name;

				// Создаем маленькую картинку
				$target_file = $postImgFolderLocation . $db_file_name;
				$resized_file = $postImgFolderLocation . "320-" . $db_file_name;
				$wmax = 320;
				$hmax = 140;
				$img = createThumbnailCropNew($target_file, $wmax, $hmax);
				$img->writeImage($resized_file);
				// Пишем в БД имя маленькой картинки
				$item->imgSmall = "320-" . $db_file_name;

			}

		}
		// END - Загрузка картинки на хостинг

		if ( empty($errors) ) {

			R::store( $item );
			header('Location: ' . HOST . 'shop?result=itemUpdated');
			// exit();

		}

	}

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/shop/item-edit.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>