<?php

function isAdmin(){
	$result = false;
	if (isset($_SESSION['logged_user']) && $_SESSION['role'] == 'admin' ) {
		$result = true;
	}
	return $result;
}

function isLoggedIn(){
	$result = false;
	if ( isset($_SESSION['logged_user']) ) {
		$result = true;
	}
	return $result;
}

function rus_date() {
	// Перевод
	$translate = array(
		"am" => "дп",
		"pm" => "пп",
		"AM" => "ДП",
		"PM" => "ПП",
		"Monday" => "Понедельник",
		"Mon" => "Пн",
		"Tuesday" => "Вторник",
		"Tue" => "Вт",
		"Wednesday" => "Среда",
		"Wed" => "Ср",
		"Thursday" => "Четверг",
		"Thu" => "Чт",
		"Friday" => "Пятница",
		"Fri" => "Пт",
		"Saturday" => "Суббота",
		"Sat" => "Сб",
		"Sunday" => "Воскресенье",
		"Sun" => "Вс",
		"January" => "Января",
		"Jan" => "Янв",
		"February" => "Февраля",
		"Feb" => "Фев",
		"March" => "Марта",
		"Mar" => "Мар",
		"April" => "Апреля",
		"Apr" => "Апр",
		"May" => "Мая",
		"May" => "Мая",
		"June" => "Июня",
		"Jun" => "Июн",
		"July" => "Июля",
		"Jul" => "Июл",
		"August" => "Августа",
		"Aug" => "Авг",
		"September" => "Сентября",
		"Sep" => "Сен",
		"October" => "Октября",
		"Oct" => "Окт",
		"November" => "Ноября",
		"Nov" => "Ноя",
		"December" => "Декабря",
		"Dec" => "Дек",
		"st" => "ое",
		"nd" => "ое",
		"rd" => "е",
		"th" => "ое"
	);
 	// если передали дату, то переводим ее
	if (func_num_args() > 1) {
		$timestamp = func_get_arg(1);
		return strtr(date(func_get_arg(0), $timestamp), $translate);
	} else {
	// иначе текущую дату
		return strtr(date(func_get_arg(0)), $translate);
	}
}

function commentNumber ($num) {

    //Оставляем две последние цифры от $num
	$number = substr($num, -2);

    //Если 2 последние цифры входят в диапазон от 11 до 14
    //Тогда подставляем окончание "ЕВ" 
	if($number > 10 and $number < 15)
	{
		$term = "ев";
	}
	else
	{ 

		$number = substr($number, -1);

		if($number == 0) {$term = "ев";}
		if($number == 1 ) {$term = "й";}
		if($number > 1 ) {$term = "я";}
		if($number > 4 ) {$term = "ев";}
	}

	echo  $num.' комментари'.$term;
}

// Функция выводит количество товаров с правильным окончанием
function goodsNumber($number) {

	if($number == 0) {$term = "ов";}
	if($number == 1 ) {$term = "";}
	if($number >= 2 ) {$term = "а";}
	if($number >= 5 ) {$term = "ов";}
	echo $number.' товар'.$term;

}

// Adjusting text encoding
function adopt($text) {
	return '=?UTF-8?B?'.base64_encode($text).'?=';
}

// Функция обрезает строку до длины не более указанного количества символов и отсекает символы после последнего пробела
function mbCutString($string, $length, $postfix = '...', $encoding = 'UTF-8' ) {

	if ( mb_strlen($string, $encoding) <= $length ) {
		return $string;
	}

	// функция mb_substr() Корректно выполняет substr() для многобайтовых кодировок, учитывая количество символов.
	$temp = mb_substr($string, 0, $length, $encoding);
	// Функция mb_strripos() — Поиск последнего вхождения одной строки в другую, нечувствительный к регистру
	// Позиция последнего пробела в обрезанной строке
	$spacePosition = mb_strripos($temp, " ", 0, $encoding);

	$result = mb_substr($temp, 0, $spacePosition, $encoding) . "...";
	return $result;

}

// Пагинация
// Функция pagination(количество_результатов_на_страницу, из_какой_таблицы)
// Возвращает массив из 3-х переменных
function pagination($results_per_page, $type){
	$number_of_results = R::count($type);

	// Определяем количество страниц для отображения всех записей
	// Функция ceil() возвращает следующее наибольшее целочисленное значение, округляя значение в случае необходимости.
	$number_of_pages = ceil($number_of_results / $results_per_page);

	// Определить на какой странице сейчас пользователь
	if ( !isset($_GET['page']) ) {
		$page_number = 1;
	} else {
		$page_number = $_GET['page'];
	}

	// Определяем sql LIMIT - начальное число для отображения результатов на каждой странице
	$starting_limit_number = ($page_number - 1) * $results_per_page;

	// Получаем выбранные результаты из БД и отображаем их на странице
	// LIMIT 0,5 - начать с нулевой записи и отобразить 5 записей
	$sql_pages_limit = 'LIMIT ' . $starting_limit_number . ',' . $results_per_page;

	$result['number_of_pages'] = $number_of_pages; // 3
	$result['page_number'] = $page_number; // 2
	$result['sql_pages_limit'] = $sql_pages_limit; // LIMIT 3,3

	return $result;
}
// - // Пагинация

function price_format($price){
	// number_format — Format a number with grouped thousands
	return number_format($price, 0, '', ' ');
}

?>