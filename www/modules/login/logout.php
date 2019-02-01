<?php

// Убиваем сессию
unset($_SESSION['logged_user']);
unset($_SESSION['role']);
session_destroy();
// Убиваем связь с сессией в cookie. В cookie хранилась специальная переменная, связанная с идентификатором сессии на сервере
setcookie(session_name(), '', time() - 60*60*24*32, '/');
header("Location: " . HOST);

?>