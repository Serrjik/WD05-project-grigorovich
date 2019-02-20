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

	case 'blog/post-edit':
		include ROOT . "modules/blog/post-edit.php";
		break;

	case 'blog/post-delete':
		include ROOT . "modules/blog/post-delete.php";
		break;

	case 'blog/post':
		include ROOT . "modules/blog/post.php";
		break;

	// ::::::::::::::::::::: PORTFOLIO :::::::::::::::::::::

	case 'portfolio':
		include ROOT . "modules/portfolio/index.php";
		break;

	case 'portfolio/work-new':
		include ROOT . "modules/portfolio/work-new.php";
		break;

	case 'portfolio/work-edit':
		include ROOT . "modules/portfolio/work-edit.php";
		break;

	// case 'portfolio/work-delete':
	// 	include ROOT . "modules/portfolio/work-delete.php";
	// 	break;

	case 'portfolio/work':
		include ROOT . "modules/portfolio/work.php";
		break;

	// ::::::::::::::::::::: CATEGORIES :::::::::::::::::::::

	case 'blog/categories':
		include ROOT . "modules/categories/all.php";
		break;

	case 'blog/category-new':
		include ROOT . "modules/categories/new.php";
		break;

	case 'blog/category-edit':
		include ROOT . "modules/categories/edit.php";
		break;

	case 'blog/category-delete':
		include ROOT . "modules/categories/delete.php";
		break;

	// ::::::::::::::::::::: CONTACTS :::::::::::::::::::::

	case 'contacts':
		include "modules/contacts/index.php";
		break;

	case 'contacts-edit':
		include "modules/contacts/edit.php";
		break;

	case 'messages':
		include "modules/contacts/messages.php";
		break;

	case 'message-delete':
		include "modules/contacts/delete.php";
		break;

	// ::::::::::::::::::::: ABOUT ME :::::::::::::::::::::

	case 'about':
		include "modules/about/index.php";
		break;

	case 'edit-text':
		include "modules/about/edit-text.php";
		break;

	case 'edit-skills':
		include "modules/about/edit-skills.php";
		break;

	case 'edit-jobs':
		include "modules/about/edit-jobs.php";
		break;

	case 'job-delete':
		include ROOT . "modules/about/job-delete.php";
		break;

	case 'job-edit':
		include ROOT . "modules/about/job-edit.php";
		break;

	// ::::::::::::::::::::: ESHOP :::::::::::::::::::::

	case 'shop':
		include ROOT . "modules/shop/index.php";
		break;

	case 'shop/new':
		include ROOT . "modules/shop/item-new.php";
		break;

	case 'shop/item':
		include ROOT . "modules/shop/item.php";
		break;

	case 'shop/item-edit':
		include ROOT . "modules/shop/item-edit.php";
		break;

	case 'shop/item-delete':
		include ROOT . "modules/shop/item-delete.php";
		break;

	// ::::::::::::::::::::: ESHOP :::::::::::::::::::::

	case 'addtocart':
		include ROOT . "modules/cart/addtocart.php";
		break;

	// ::::::::::::::::::::: DEFAULT :::::::::::::::::::::

	default:
		include "modules/main/index.php";
		break;
}

?>