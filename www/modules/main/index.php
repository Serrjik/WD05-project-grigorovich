<?php

// Получим данные обо мне
$about = R::findOne('about', 1);
// Получим данные блога
$posts = R::find('posts', 'ORDER BY id DESC LIMIT 3');
$works = R::find('works', 'ORDER BY id DESC LIMIT 3');


$title = "Главная";
// $content = "Содержимое главной страницы";

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