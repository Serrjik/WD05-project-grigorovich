<?php

$title = "Оплата заказа - Магазин";

if ( !isset($_SESSION['order']) ) {
	header('Location: ' . HOST);
	die();
}



// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/payments/yandex-payment.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>