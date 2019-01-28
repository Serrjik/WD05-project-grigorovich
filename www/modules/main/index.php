<?php

$title = "Главная";
$content = "Содержимое главной страницы";

ob_start();
include ROOT . 'templates/main/main.tpl';
// Функция ob_get_contents() возвращает всё что было выведено с момента запуска функции ob_start() (содержимое внутреннего буфера)
$content = ob_get_contents();
// Очистка содержимого буфера
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_header.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';

?>