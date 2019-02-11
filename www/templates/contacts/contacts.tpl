<div class="sticky-footer-content">
	<div class="container user-content pt-80 pb-80">
		<div class="row">
			<div class="col contacts-links">
				<div class="contacts-links__button"><a class="button button-edit" href="<?=HOST?>contacts-edit">Редактировать</a></div>
				<div class="contacts-links__button"><a class="button" href="<?=HOST?>messages">Сообщения</a></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 contacts">
				<div class="contacts__title">Контакты </div>
				<div class="row">
					<div class="col-4 contacts__name">Email</div>
					<div class="col-6 contacts__value contacts__value--link"><a href="#!">webdev-ninja@mail.ru</a></div>
				</div>
				<div class="row">
					<div class="col-4 contacts__name">Skype</div>
					<div class="col-6 contacts__value contacts__value--link"><a class="contacts__value--link" href="#!">webdev-ninja</a></div>
				</div>
				<div class="row">
					<div class="col-4 contacts__name">Социальные сети</div>
					<div class="col-6 contacts__value">
						<div class="contacts__value--bold-link"><a href="#!">Профиль Вконтакте</a></div>
						<div class="contacts__value--bold-link"><a href="#!">Профиль Facebook</a></div>
					</div>
				</div>
				<div class="row mt-15">
					<div class="col-4 contacts__name">Телефон</div>
					<div class="col-6 contacts__value mb-10">+595-456-123</div>
				</div>
				<div class="row">
					<div class="col-4 contacts__name">Адрес</div>
					<div class="col-6 contacts__value">Россия, Московская обл. г. Зеленоград </div>
				</div>
			</div>
			<div class="col-md-4">
				<form class="form-contact">
					<div class="form-contact__title">Связаться со мной</div>
					<div class="form-contact__name"><input class="input-text" type="text" placeholder="Введите имя" /></div>
					<div class="form-contact__email"><input class="input-text" type="text" placeholder="Email" /></div>
					<div class="form-contact__message"><textarea class="textarea" type="text" placeholder="Сообщение"></textarea></div>
					<div class="form-contact__load-file">
						<div class="load-file-title">Прикрепить файл </div>
						<div class="load-file-opis">jpg, png, pdf, doc, весом до 2Мб.</div>
						<div class="load-file-fieldset"><input class="inputfile inputfile-rad" id="file" type="file" name="file" data-multiple-caption="{count} файлов выбрано" multiple="" /><label for="file">Выбрать файл</label><span>Файл не выбран</span></div>
					</div>
					<div class="form-contact__save"><input class="button button-save" type="submit" value="Отправить" name="name" /></div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="map" id="map"></div>
<script async="async" defer="defer" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAIr67yxxPmnF-xb4JVokCVGgLbPtuqxiA&amp;callback=initMap"></script>
