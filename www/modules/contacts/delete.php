<?php

if ( !isAdmin() ) {
	header('Location: ' . HOST);
	die();
}

$title = "Удалить сообщение";

$message = R::load('messages', $_GET['id']);

// echo "<pre>";
// print_r($message);
// echo "</pre>";
// die();

if ( isset($_POST['messageDelete']) ) {

	$postImgFolderLocation = ROOT . 'usercontent/upload_files/'; // usercontent/upload_files/file.docx

	// Если к сообщению прикреплен файл, то удаляем его
	$messageFile = $message->message_file;
	if ( $messageFile != '' ) {
		$fileURL = $postImgFolderLocation . $messageFile; // usercontent/upload_files/file.docx
		// Удаляем файл с помощью функции unlink()
		if ( file_exists($fileURL) ) {
			unlink($fileURL);
		}
	}

	R::trash($message);
	header('Location: ' . HOST . "messages?result=messageDeleted");
	exit();

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/contacts/message-delete.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>