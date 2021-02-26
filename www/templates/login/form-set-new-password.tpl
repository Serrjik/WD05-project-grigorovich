<form id="setNewPasswordForm" class="registration-form" method="POST" action="<?=HOST?>set-new-password" novalidate >
	<?php if ( $newPasswordReady == false ): ?>
		<h1 class="title-1 registration-form__caption">Введите новый пароль</h1>
	<?php endif ?>

	<div id="errorBox" class="registration-form__error">

		<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>
		<?php require ROOT . 'templates/_parts/_success.tpl'; ?>

		<!-- <div id="inputEmailEmpty" class="notification__error">Введите email</div> -->
	</div>
	<div class="password-remember-wrapper content-center">
		<a class="registration-form__password-recovery" href="<?=HOST?>login">Перейти на страницу входа</a>
	</div>
	<div class="registration-form__button">
		<?php if ( $newPasswordReady == false ): ?>
			<div class="registration-form__password"><input id="password" class="input-text" type="password" name="resetpassword" placeholder="Новый пароль" /></div>
			<input type="hidden" name="resetemail" value="<?=$_GET['email']?>">
			<input type="hidden" name="onetimecode" value="<?=$_GET['code']?>">
			<input class="button button-enter button-small" type="submit" value="Установить новый пароль" name="set-new-password" />
		<?php endif ?>
	</div>
</form>