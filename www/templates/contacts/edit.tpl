<div class="sticky-footer-content">
	<div class="container user-content pt-70">
		<h1 class="title-1">Редактировать данные</h1>
		<form class="contacts-edit-form" action="<?=HOST?>contacts-edit">
			<div class="row contacts-edit-form__row">
				<div class="col-md-3"><label class="label">Имя
					<input class="input-text" type="text" placeholder="Введите имя" name="name" /></label>
				</div>
				<div class="col-md-3"><label class="label">Фамилия
					<input class="input-text" type="text" placeholder="Введите фамилию" name="surname" /></label>
				</div>
			</div>
			<div class="row contacts-edit-form__row">
				<div class="col-md-3"><label class="label">Email
					<input class="input-text" type="text" placeholder="Введите email" name="email" /></label>
				</div>
				<div class="col-md-3"><label class="label">Skype
					<input class="input-text" type="text" placeholder="Введите skype" name="skype" /></label>
				</div>
			</div>
			<div class="row contacts-edit-form__row">
				<div class="col-md-3"><label class="label">Вконтакте
					<input class="input-text" type="text" placeholder="Введите ссылку на профиль" name="vkontakte" /></label>
				</div>
				<div class="col-md-3"><label class="label">Facebook
					<input class="input-text" type="text" placeholder="Введите ссылку на профиль" name="facebook" /></label>
				</div>
				<div class="col-md-3"><label class="label">Github
					<input class="input-text" type="text" placeholder="Введите ссылку на профиль" name="github" /></label>
				</div>
				<div class="col-md-3"><label class="label">Twitter
					<input class="input-text" type="text" placeholder="Введите ссылку на профиль" name="twitter" /></label>
				</div>
			</div>
			<div class="row contacts-edit-form__row">
				<div class="col-md-3"><label class="label">Телефон
					<input class="input-text" type="text" placeholder="Введите телефон" name="phone" /></label>
				</div>
				<div class="col-md-3"><label class="label">Адрес
					<input class="input-text" type="text" placeholder="Введите адрес" name="address" /></label>
				</div>
			</div>
			<div class="row contacts-edit-form__row">
				<div class="form-button-save">
					<input class="button button-save" type="submit" value="Сохранить" name="contactsUpdate" />
				</div>
				<div class="form-button-cancel">
					<a class="button" href="<?=HOST?>contacts">Отмена</a>
				</div>
			</div>
		</form>
	</div>
</div>