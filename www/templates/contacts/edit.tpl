<?php
	// Функция выводит значения для полей ввода из массива POST, если он установлен. Иначе выводит значения полей из таблицы contacts в БД
	function dataFromPost($fieldName) {
		global $contacts;
		echo (@$_POST[$fieldName] != '') ? $_POST[$fieldName] : $contacts[$fieldName];
	}
?>

<div class="sticky-footer-content">
	<div class="container user-content container-adaptive-small-padding-top">

		<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>

		<h1 class="title-1">Редактировать данные</h1>
		<form class="contacts-edit-form" action="<?=HOST?>contacts-edit" method="POST">
			<div class="row contacts-edit-form__row">
				<div class="col-md-3">
					<label class="label">Имя
						<input class="input-text" 
						type="text" 
						placeholder="Введите имя" 
						name="name" 
						value="<?=dataFromPost("name");?>" />
				</label>
				</div>
				<div class="col-md-3">
					<label class="label">Фамилия
					<input class="input-text" 
						type="text" 
						placeholder="Введите фамилию" 
						name="surname" 
						value="<?=dataFromPost("surname");?>" />
				</label>
				</div>
			</div>
			<div class="row contacts-edit-form__row">
				<div class="col-md-3">
					<label class="label">Email
						<input class="input-text" 
							type="text" 
							placeholder="Введите email" 
							name="email" 
							value="<?=dataFromPost("email");?>" />
					</label>
				</div>
				<div class="col-md-3">
					<label class="label">Skype
						<input class="input-text" 
							type="text" 
							placeholder="Введите skype" 
							name="skype" 
							value="<?=dataFromPost("skype");?>" />
					</label>
				</div>
			</div>
			<div class="row contacts-edit-form__row">
				<div class="col-md-3">
					<label class="label">Вконтакте
						<input class="input-text" 
							type="text" 
							placeholder="Введите ссылку на профиль" 
							name="vkontakte" 
							value="<?=dataFromPost("vkontakte");?>" />
					</label>
				</div>
				<div class="col-md-3">
					<label class="label">Facebook
						<input class="input-text" 
							type="text" 
							placeholder="Введите ссылку на профиль" 
							name="facebook" 
							value="<?=dataFromPost("facebook");?>" />
					</label>
				</div>
				<div class="col-md-3">
					<label class="label">Github
						<input class="input-text" 
							type="text" 
							placeholder="Введите ссылку на профиль" 
							name="github" 
							value="<?=dataFromPost("github");?>" />
					</label>
				</div>
				<div class="col-md-3">
					<label class="label">Twitter
						<input class="input-text" 
							type="text" 
							placeholder="Введите ссылку на профиль" 
							name="twitter" 
							value="<?=dataFromPost("twitter");?>" />
					</label>
				</div>
			</div>
			<div class="row contacts-edit-form__row">
				<div class="col-md-3">
					<label class="label">Телефон
						<input class="input-text" 
							type="text" 
							placeholder="Введите телефон" 
							name="phone" 
							value="<?=dataFromPost("phone");?>" />
					</label>
				</div>
				<div class="col-md-3">
					<label class="label">Адрес
						<input class="input-text" 
							type="text" 
							placeholder="Введите адрес" 
							name="address" 
							value="<?=dataFromPost("address");?>" />
					</label>
				</div>
			</div>
			<div class="row contacts-edit-form__row">
				<div class="form-button-save contacts-edit-form__button">
					<input class="button button-save" type="submit" value="Сохранить" name="contactsUpdate" />
				</div>
				<div class="form-button-cancel">
					<a class="button" href="<?=HOST?>contacts">Отмена</a>
				</div>
			</div>
		</form>
	</div>
</div>