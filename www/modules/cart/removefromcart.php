<?php

// ID товара который удаляем из Корзины
$currentItemId = intval($_POST['itemId']);

// Определяем локальную корзину
if ( isset($_COOKIE['cart']) ) {
	$cartLocal = json_decode($_COOKIE['cart'], true);
} else {
	$cartLocal = array();
}

// Уменьшаем кол-во товара в корзине на 1, либо если его кол-во = 0, тогда убираем его из массива корзины
if ( isset($cartLocal[$currentItemId]) ) {
	if ( $cartLocal[$currentItemId] > 1 ) {
		$items = $cartLocal[$currentItemId]; // 3
		$items--; // 2
		$cartLocal[$currentItemId] = $items; // 2
	} else {
		unset($cartLocal[$currentItemId]);
	}
}

// Сохраняем Cookies
SetCookie("cart", json_encode($cartLocal));

// Если пользователь залогинен, то сохраняем в БД
if ( isLoggedIn() ) {
	$currentUser = $_SESSION['logged_user'];
	$user = R::load('users', $currentUser->id);
	$user->cart = json_encode($cartLocal);
	R::store($user);
}

// Возвращаемся обратно на страницу с корзиной
header('Location: ' . HOST . 'cart');
exit();

?>