<?php

$title = "Мои заказы - Магазин";

// Зная id пользователя находим его заказы
if ( isLoggedIn() ) {
	$myOrders = R::find( 'orders', 'user_id = ' . $_SESSION['logged_user']['id'] );
} else {
	header('Location: '. HOST . "login");
	exit();
}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/orders/myorders.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>