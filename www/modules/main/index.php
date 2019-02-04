<?php

// Выведем данные о пользователе
$details = R::find('about', 1);

$aboutName = $details[1]['name'];
$aboutDescription = $details[1]['description'];

$title = "Главная";
$content = "Содержимое главной страницы";

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
include ROOT . 'templates/main/main.tpl';
// Функция ob_get_contents() возвращает всё что было выведено с момента запуска функции ob_start() (содержимое внутреннего буфера)
$content = ob_get_contents();
// Очистка содержимого буфера
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>