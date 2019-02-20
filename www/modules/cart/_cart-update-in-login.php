<?php

// Загружаем пользователя, на случай, если придется обновить корзину на сервере
$currentUser = $_SESSION['logged_user'];
$user = R::load('users', $currentUser->id);

// Определяем корзину в БД
$cartServer = json_decode($user->cart, true);

// Определяем локальную корзину
if ( isset($_COOKIE['cart']) ) {
	$cartLocal = json_decode($_COOKIE['cart'], true);
} else {
	$cartLocal = array();
}

?>