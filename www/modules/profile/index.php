<?php

$title = "Профиль пользователя";

$currentUser = $_SESSION['logged_user'];

// Запрос на комментарии пользователя, вошедшего на сайт + id и title постов, к которым оставлены комментарии
$sqlComments = 'SELECT 
			comments.user_id, comments.text, comments.date_time, 
			posts.id, posts.title 
		FROM `comments` 
		INNER JOIN posts 
		ON comments.post_id = posts.id 
		WHERE comments.user_id = ' . $currentUser->id;

$comments = R::getAll( $sqlComments );

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/profile/profile.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>