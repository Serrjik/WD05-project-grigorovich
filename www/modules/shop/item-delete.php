<?php

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Удалить товар";

$item = R::load('goods', $_GET['id']);

if ( isset($_POST['itemDelete']) ) {

	$imgFolderLocation = ROOT . 'usercontent/shop/'; // usercontent/shop/9989234798.jpg

	// Если картинка товара установлена, то удаляем её файл
	$itemImg = $item->img;
	if ( $itemImg != '' ) {
		$picurl = $imgFolderLocation . $itemImg; // usercontent/shop/foto.jpg
		$picurl320 = $imgFolderLocation . "320-" . $itemImg; // usercontent/shop/320-foto.jpg
		// Удаляем картинку товара с помощью функции unlink()
		if ( file_exists($picurl) ) {
			unlink($picurl);
		}
		if ( file_exists($picurl320) ) {
			unlink($picurl320);
		}
	}

	R::trash($item);
	header('Location: ' . HOST . "shop?result=itemDeleted");
	exit();

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/shop/item-delete.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>