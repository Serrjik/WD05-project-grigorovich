<?php

if ( isset($_SESSION['logged_user']) && $_SESSION['role'] == 'admin' ) {
	include ROOT . 'templates/_parts/_admin-panel.tpl';
}

?>

<div class="header">
	<div class="header__left-side">
		<?php include ROOT . 'templates/_parts/_header-logo.tpl'; ?>
		<?php include ROOT . 'templates/_parts/_header-nav.tpl'; ?>
	</div>

	<?php
	if ( isset($_SESSION['logged_user']) ) {
		
		// Пользователь на сайте
		if ( $_SESSION['role'] != 'admin' ) {
			// Пользователь на сайте - НЕадмин
			include ROOT . 'templates/_parts/_header-user-profile.tpl';
		}
	} else {
		// Нет пользователя
		include ROOT . 'templates/_parts/_header-user-login-links.tpl';
	}
	?>

</div>