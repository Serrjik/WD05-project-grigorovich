<?php

$title = "Создать заказ - Магазин";

/*   * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
	ПОЛУЧАЕМ ДАННЫЕ ДЛЯ ВЫВОДА ТОВАРОВ ЗАКАЗА
* * * * * * * * * * * * * * * * * * * * * * * * * * * *   */
/*
	Корзину формируем на основе корзины в Cookies
	Но, в Cookies лежат только ID и КОЛ-ВО товаров.
	Поэтому делаем запрос в БД, чтобы получить картинки и названия товаров.
*/
if ( isset($_COOKIE['cart']) ) {
	$cookieCartArray = json_decode($_COOKIE['cart'], true);

	// Запрашиваем Cookie
	if ( count( $cookieCartArray ) > 0 ) {
		$cartItems = array();
		foreach ( $cookieCartArray as $key => $value) {
			// Массив, где находятся только id товаров [1, 5, 10]
			$cartItems[] = $key;
		}

		// На основе Cookie отправляем запрос в БД на товары в корзине
		$cartGoods = R::findLike('goods', [
			// 'id' => ['10', '11']
			'id' => $cartItems
		], 'ORDER BY id ASC');

	} else {
		$cartGoods = array();
	}

}

$cartItemsArray = json_decode($_COOKIE['cart'], true);
$cartGoodsCount = array_sum($cartItemsArray); // количество элементов в корзине

$cartGoodsTotalPrice = 0; //Общая цена товаров
foreach ( $cartGoods as $item ) {
	$cartGoodsTotalPrice += $cartItemsArray[$item->id] * $item->price;
}

if ( $cartGoodsCount <= 0 ) {
	header('Location: ' . HOST . 'cart');
	exit();
}

/*   * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
	ОБРАБОТКА POST ЗАПРОСА, СОХРАНЯЕМ ЗАКАЗ В БД
* * * * * * * * * * * * * * * * * * * * * * * * * * * *   */

if ( isset($_POST['createOrder']) ) {

	if ( $cartGoodsCount <= 0 ) {
		$errors[] = [
			'title' => 'Заказ не может быть пустым', 
			'desc' => '<p>Добавьте товары в корзину чтобы сделать заказ.</p>'
		];
	}

	if ( trim($_POST['name']) == '' ) {
		$errors[] = ['title' => 'Введите Имя' ];
	}

	if ( trim($_POST['surname']) == '' ) {
		$errors[] = ['title' => 'Введите Фамилию' ];
	}

	if ( trim($_POST['email']) == '' ) {
		$errors[] = ['title' => 'Введите Email' ];
	}

	if ( trim($_POST['phone']) == '' ) {
		$errors[] = ['title' => 'Введите телефон' ];
	}

	if ( empty($errors) ) {

		$order = R::dispense('orders');

		$order->name = htmlentities($_POST['name']);
		$order->surname = htmlentities($_POST['surname']);
		$order->email = htmlentities($_POST['email']);
		$order->phone = htmlentities($_POST['phone']);
		$order->address = htmlentities($_POST['address']);
		$order->items = json_encode($orderedGoodsSummary);
	}


}


// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/orders/order-create.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>