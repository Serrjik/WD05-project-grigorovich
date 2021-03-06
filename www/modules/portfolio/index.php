<?php

$pagination = pagination(9, 'works');

$title = "Работы - все работы";

$works = R::find('works', 'ORDER BY id DESC ' . $pagination['sql_pages_limit']);

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/portfolio/works-all-works.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>