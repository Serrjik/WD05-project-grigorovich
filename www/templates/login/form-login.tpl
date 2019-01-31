<form class="registration-form" method="POST" action="<?=HOST?>login">
	<h1 class="title-1 registration-form__caption">Вход на сайт</h1>
	<div class="registration-form__error">
		
		<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>

		<!-- <div class="notification__error">Введите email</div> -->
	</div>
	<div class="registration-form__email"><input class="input-text" type="email" name="email" placeholder="E-mail" value="info@uac.com" /></div>
	<div class="registration-form__password"><input class="input-text" type="password" name="password" placeholder="Пароль" value="123456" /></div>
	<div class="password-remember-wrapper">
		<div class="registration-form__remember">
			<label class="form-label">
				<input class="form-input-checkbox" type="checkbox" name="checkbox" checked="checked" />
				<span class="form__checkbox"></span>Запомнить меня
			</label>
		</div>
		<span><a class="registration-form__password-recovery" href="#!">Забыл пароль</a></span>
	</div>
	<div class="registration-form__button"><input class="button button-enter button-small" type="submit" value="Войти" name="login" /></div>
</form>