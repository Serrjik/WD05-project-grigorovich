<?php

// echo "<pre>";
// print_r($_POST);
// echo "</pre>";
// die();

// ID товара который добавили в Корзину
$currentItemId = intval($_POST['itemId']);

// Определяем локальную корзину
if ( isset($_COOKIE['cart']) ) {
	// json_decode - ф-я которая преобразует JSON формат в Объект
	// либо в Ассоциативный массив, если 2-й параметр = true
	// Мы для PHP преобразуем в Ассоциативный массив
	$cartLocal = json_decode($_COOKIE['cart'], true);
} else {
	$cartLocal = array();
}

// Если такой товар уже есть в Корзине, тогда увеличиваем его кол-во на 1, если нет, то записываем его кол-во = 1
if ( isset($cartLocal[$currentItemId]) ) {
	$items = $cartLocal[$currentItemId]; // 2
	$items++; // 3
	$cartLocal[$currentItemId] = $items; // 3
} else {
	$cartLocal[$currentItemId] = 1;
}

// Сохраняем Cookies
// json_encode - ф-я кодирует ассоц. массив в JSON строку
// Мы преобразуем в JSON строку чтобы удобно было работать c ней через JS
SetCookie("cart", json_encode($cartLocal));

// Если пользователь залогинен, то сохраняем в БД
if ( isLoggedIn() ) {
	$currentUser = $_SESSION['logged_user'];
	$user = R::load('users', $currentUser->id);
	$user->cart = json_encode($cartLocal);
	R::store($user);
}

// Read cookie:
// $.cookie('cart'); // => "value"

header("Location: " . HOST . "shop/item?id=" . $currentItemId );
exit();

?>