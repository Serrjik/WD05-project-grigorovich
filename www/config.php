<?php

// DB SETTINGS
define('DB_HOST', 'localhost');
define('DB_NAME', 'WD05-project-grigorovich');
define('DB_USER', 'root');
define('DB_PASS', '');

// SITE SETTINGS FOR EMAILS
define('SITE_NAME', 'Сайт портфолио - Сергей Григорович');
define('SITE_EMAIL', 'info@serjik.zzz.com.ua');
define('ADMIN_EMAIL', 'uac.sarge@gmail.com');

// Устанавливает путь до корневой директории скрипта по протоколу HTTP
// $_SERVER['REQUEST_SCHEME'] не использую, а вручную прописываю протокол http, потому что эта переменная поддерживается не всеми серверами
define('HOST', 'http://' . $_SERVER['HTTP_HOST'] . '/');

// Устанавливает физический путь до корневой директории скрипта
define('ROOT', dirname(__FILE__).'/');

?>