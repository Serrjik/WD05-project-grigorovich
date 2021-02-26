<?php

$title = "Инфо о заказе - Магазин";

if ( !isLoggedIn() ) {
	header('Location: ' . HOST);
	die();
}

$orderId = intval($_GET['id']);
$order = R::findOne('orders', 'id = '.$orderId);

if ( $order->user_id != $_SESSION['logged_user']['id'] ) {
	header('Location: ' . HOST);
	die();
}

$orderItems = json_decode($order['items']);

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/orders/myorder.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>