<?php

$title = "Обо мне";

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/about/about.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>