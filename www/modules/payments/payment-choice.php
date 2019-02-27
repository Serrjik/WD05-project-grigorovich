<?php

$title = "Выбор типа оплаты - Магазин";

if ( isset($_GET['id']) && isLoggedIn() ) {
	// Пользователь залогинен
	// Проверяем что это заказ пользователя
	$orderId = intval($_GET['id']);
	$order = R::findOne('orders', 'id = ' . $orderId);
	if ( $order->user_id != $_SESSION['logged_user']['id'] ) {
		header('Location: ' . HOST);
		die();
	}
	$_SESSION['order'] = $order;
} elseif ( isset($_SESSION['current_order']) ) {
	$orderId = $_SESSION['current_order'];
	$order = R::findOne('orders', 'id = ' . $orderId);
	$_SESSION['order'] = $order;
} else {
	header('Location: ' . HOST);
	die();
}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/payments/payment-choice.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>