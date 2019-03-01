<?php

// Убиваем сессию
unset($_SESSION['logged_user']);
unset($_SESSION['role']);
SetCookie("cart", "");
session_destroy();
// Убиваем связь с сессией в cookie. В cookie хранилась специальная переменная, связанная с идентификатором сессии на сервере
setcookie(session_name(), '', time() - 60*60*24*32, '/');

$user = R::load('users', $user->id);
$user->password_cookie_token = NULL;
R::store($user);
setcookie('password_cookie_token', '', time() - 3600 );

header("Location: " . HOST);

?>