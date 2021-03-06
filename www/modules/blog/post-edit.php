<?php

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Редактировать пост";

$post = R::load('posts', $_GET['id']);
$cats = R::find('categories', 'ORDER BY cat_title ASC');

if ( isset($_POST['postUpdate']) ) {

	if ( trim($_POST['postTitle']) == '' ) {
		$errors[] = ['title' => 'Введите Название поста' ];
	}

	if ( trim($_POST['postText']) == '' ) {
		$errors[] = ['title' => 'Введите Текст поста' ];
	}

	if ( empty($errors) ) {

		$post->title = htmlentities(trim($_POST['postTitle']));
		$post->cat = htmlentities(trim($_POST['postCat']));
		$post->text = trim($_POST['postText']);
		$post->authorId = $_SESSION['logged_user']['id'];
		$post->updateTime = R::isoDateTime();

		if ( isset($_FILES['postImg']['name']) && $_FILES['postImg']['tmp_name'] != "" ) {

			// Write file image params in variables
			$fileName = $_FILES['postImg']['name'];
			$fileTmpLoc = $_FILES['postImg']['tmp_name'];
			$fileType = $_FILES['postImg']['type'];
			$fileSize = $_FILES['postImg']['size'];
			$fileErrorMsg = $_FILES['postImg']['error'];
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
				if ( $width < 10 || $height < 10 ) {
					$errors[] = ['title' => 'Изображение не имеет размеров. Загрузите изображение побольше.' ];
				}
			}  


			if ( empty($errors) ) {

				// Перемещаем загруженный файл в нужную директорию
				// Для имени файла генерируется случайное число
				$db_file_name = rand(100000000000, 999999999999) . "." . $fileExt; // 9989234798.jpg
				$postImgFolderLocation = ROOT . 'usercontent/blog/'; // usercontent/blog/9989234798.jpg
				$uploadfile = $postImgFolderLocation . $db_file_name;
				$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

				// Если картинка в блоге уже установлена, то есть загружена ранее, то удаляем её файл
				$postImg = $post->post_img;
				if ( $postImg != '' ) {
					$picurl = $postImgFolderLocation . $postImg; // usercontent/blog/oldfoto.jpg
					$picurl320 = $postImgFolderLocation . "320-" . $postImg; // usercontent/blog/320-oldfoto.jpg
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
				$img = createThumbnailCrop($target_file, $wmax, $hmax);
				$img->writeImage($target_file);
				// Пишем в БД имя большой картинки
				$post->postImg = $db_file_name;

				// Создаем маленькую картинку
				$target_file = $postImgFolderLocation . $db_file_name;
				$resized_file = $postImgFolderLocation . "320-" . $db_file_name;
				$wmax = 320;
				$hmax = 140;
				$img = createThumbnailCrop($target_file, $wmax, $hmax);
				$img->writeImage($resized_file);
				// Пишем в БД имя маленькой картинки
				$post->postImgSmall = "320-" . $db_file_name;

			}

		}

		if ( empty($errors) ) {

			R::store( $post );
			header('Location: ' . HOST . 'blog?result=postUpdated');
			// exit();

		}

	}

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/blog/post-edit.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>