<?php

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Удалить работу";

$work = R::load('works', $_GET['id']);

if ( isset($_POST['workDelete']) ) {

	$workImgFolderLocation = ROOT . 'usercontent/portfolio/'; // usercontent/portfolio/9989234798.jpg

	// Если картинка работы установлена, то удаляем её файл
	$workImg = $work->work_image;
	if ( $workImg != '' ) {
		$picurl = $workImgFolderLocation . $workImg; // usercontent/portfolio/foto.jpg
		$picurl360 = $workImgFolderLocation . "360-" . $workImg; // usercontent/portfolio/360-foto.jpg
		// Удаляем картинку работы с помощью функции unlink()
		if ( file_exists($picurl) ) {
			unlink($picurl);
		}
		if ( file_exists($picurl360) ) {
			unlink($picurl360);
		}
	}

	R::trash($work);
	header('Location: ' . HOST . "portfolio?result=workDeleted");
	exit();

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/portfolio/work-delete.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>