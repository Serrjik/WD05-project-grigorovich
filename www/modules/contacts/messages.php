<?php

$title = "Контакты";

$messages = R::find('messages', 'ORDER BY id DESC');

R::exec('UPDATE messages SET read_status = "read" WHERE read_status = "unread" ');
$unreadMessages = 0;

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/contacts/messages.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>