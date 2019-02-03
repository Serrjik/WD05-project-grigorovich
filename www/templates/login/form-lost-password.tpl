<form id="lost-password-form" class="registration-form" method="POST" action="<?=HOST?>lost-password">
	<h1 class="title-1 registration-form__caption">Забыл пароль</h1>
		<?php 
		echo "<pre>";
		print_r($_POST);
		echo "</pre>";
		 ?>
	<div id="errorBox" class="registration-form__error">

		<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>

		<!-- <div id="inputEmailEmpty" class="notification__error">Введите email</div> -->
	</div>
	<div class="registration-form__email"><input id="email" class="input-text" type="email" name="email" placeholder="E-mail" value="info@uac.com" /></div>
	<div class="password-remember-wrapper content-center">
		<a class="registration-form__password-recovery" href="<?=HOST?>login">Перейти на страницу входа</a>
	</div>
	<div class="registration-form__button"><input class="button button-enter button-small" type="submit" value="Восстановить пароль" name="lost-password" /></div>
</form>