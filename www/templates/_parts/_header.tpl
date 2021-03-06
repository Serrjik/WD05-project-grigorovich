<?php if ( isAdmin() ) {
	include ROOT . 'templates/_parts/_admin-panel.tpl';
} ?>

<div class="header">
	<div class="header__left-side">
		<?php include ROOT . 'templates/_parts/_header-logo.tpl'; ?>
		<?php include ROOT . 'templates/_parts/_header-nav.tpl'; ?>
	</div>
	<!-- Товаров в корзине -->
	<?php include ROOT . 'templates/_parts/_cart-in-header.tpl'; ?>

	<?php
	if ( isLoggedIn() ) {
		
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