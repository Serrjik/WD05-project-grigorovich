<?php

$title = "Удалить пост";

$post = R::load('posts', $_GET['id']);

if ( isset($_POST['postDelete']) ) {

	$postImgFolderLocation = ROOT . 'usercontent/blog/'; // usercontent/blog/9989234798.jpg

	// Если картинка в блоге установлена, то удаляем её файл
	$postImg = $post->post_img;
	if ( $postImg != '' ) {
		$picurl = $postImgFolderLocation . $postImg; // usercontent/blog/foto.jpg
		$picurl320 = $postImgFolderLocation . "320-" . $postImg; // usercontent/blog/320-foto.jpg
		// Удаляем картинку блога с помощью функции unlink()
		if ( file_exists($picurl) ) {
			unlink($picurl);
		}
		if ( file_exists($picurl320) ) {
			unlink($picurl320);
		}
	}

	R::trash($post);
	header('Location: ' . HOST . "blog?result=postDeleted");
	exit();

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/blog/post-delete.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>