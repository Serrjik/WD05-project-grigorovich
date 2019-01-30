<form class="registration-form" method="POST" action="<?=HOST?>registration">
	<h1 class="title-1 registration-form__caption">Регистрация</h1>
	<div class="registration-form__error">

		<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>

		<!-- <div class="notification__error--text">
			<div class="notification__error notification__error--top notification__error--top-border-radius">Данный email уже занят</div>
			<span class="mb-20">Используйте другой email чтобы создать новый аккаунт</span>
			<span>Или воспользуйтесь <a href="#{link}">восстановлением пароля</a>, чтобы войти на сайт.</span>
		</div> -->
	</div>
	<div class="registration-form__email"><input class="input-text" type="email" placeholder="E-mail" name="email" value="info@uac.com" /></div>
	<div class="registration-form__password"><input class="input-text" type="password" placeholder="Пароль" name="password" value="123456" /></div>
	<div class="registration-form__button"><input class="button button-enter" type="submit" value="Регистрация" name="register" /></div>
</form>