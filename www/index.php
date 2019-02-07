<?php

require "config.php";
require "db.php";
require ROOT . "libs/functions.php";
session_start();

$errors = array();
$success = array();

// ===============================
// 
//				РОУТЕР
// 
// ===============================

// request URL = http://wd05-project-grigorovich/portfolio/
// request URL = http://wd05-project-grigorovich/blog/post?id=15
$uri = $_SERVER['REQUEST_URI']; // /portfolio/
$uri = rtrim($uri, "/"); // /portfolio
$uri = filter_var($uri, FILTER_SANITIZE_URL);
$uri = substr($uri, 1); // portfolio
$uri = explode('?', $uri);

switch ( $uri[0] ) {
	case '':
		include "modules/main/index.php";
		break;

	// ::::::::::::::::::::: USERS :::::::::::::::::::::

	case 'login':
		require ROOT . "modules/login/login.php";
		break;

	case 'registration':
		require ROOT . "modules/login/registration.php";
		break;

	case 'logout':
		require ROOT . "modules/login/logout.php";
		break;

	case 'lost-password':
		require ROOT . "modules/login/lost-password.php";
		break;

	case 'set-new-password':
		require ROOT . "modules/login/set-new-password.php";
		break;

	case 'profile':
		require ROOT . "modules/profile/index.php";
		break;

	case 'profile-edit':
		require ROOT . "modules/profile/edit.php";
		break;

	// ::::::::::::::::::::: BLOG :::::::::::::::::::::

	case 'blog':
		include ROOT . "modules/blog/index.php";
		break;

	case 'blog/post-new':
		include ROOT . "modules/blog/post-new.php";
		break;

	case 'blog/post':
		include ROOT . "modules/blog/post.php";
		break;

	// ::::::::::::

	case 'about':
		include "modules/about/index.php";
		break;

	case 'contacts':
		include "modules/contacts/index.php";
		break;

	default:
		include "modules/main/index.php";
		break;
}

?>