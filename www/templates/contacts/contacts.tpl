<div class="container user-content pt-80 pb-80">

	<?php if ( isAdmin() ): ?>
		<div class="row">
			<div class="col contacts-links">
				<div class="contacts-links__button"><a class="button button-edit" href="<?=HOST?>contacts-edit">Редактировать</a></div>
				<div class="contacts-links__button"><a class="button" href="<?=HOST?>messages">Сообщения</a></div>
			</div>
		</div>
	<?php endif ?>

	<div class="row">
		<div class="col-md-6 contacts">
			<div class="contacts__title">Контакты </div>

			<!-- Функция выводит 1 запись в блоке "Контакты" -->
			<?php function showContactItem($name, $title, $type = '') {
				global $contacts;

				if ( @$contacts[$name] != "" ) { ?>
					<div class="row">
						<div class="col-4 contacts__name"><?=$title?></div>
						<div class="col-6 contacts__value contacts__value--link">
							<?php if ( $name == 'email' ): ?>
								<a href="mailto:<?=$contacts[$name]?>"
									target="_blank" >
									<?=$contacts[$name]?>
								</a>
							<?php elseif ( $name == 'phone' ): ?>
								<a href="tel:<?=$contacts[$name]?>"
									target="_blank" >
									<?=$contacts[$name]?>
								</a>
							<?php elseif ( $name == 'skype' ): ?>
								<a href="skype:<?=$contacts[$name]?>?chat"
									target="_blank" >
									<?=$contacts[$name]?>
								</a>
							<?php elseif ( $name == 'github' ): ?>
								<a class="contacts__value--bold-link" href="<?=$contacts[$name]?>"
									target="_blank" >
									<?=$contacts[$name]?>
								</a>
							<?php else: ?>
								<?=$contacts[$name]?>
							<?php endif ?>
						</div>
					</div>
				<?php }

			} ?>
			<!-- // showContactItem() -->

			<?php showContactItem('name', 'Имя') ?>
			<?php showContactItem('surname', 'Фамилия') ?>
			<?php showContactItem('email', 'Email') ?>
			<?php showContactItem('skype', 'Skype') ?>

			<?php if ( ($contacts['vkontakte'] != "") || ($contacts['facebook'] != "") || ($contacts['twitter'] != "") ): ?>
			<div class="row mb-15">
				<div class="col-4 contacts__name">Социальные сети</div>
				<div class="col-6 contacts__value">
					<?php if ( $contacts['vkontakte'] != "" ): ?>
						<a class="contacts__value--bold-link" href="<?=$contacts['vkontakte']?>"
							target="_blank" >
							Профиль Вконтакте
						</a>
					<?php endif ?>
					<?php if ( $contacts['facebook'] != "" ): ?>
						<a class="contacts__value--bold-link" href="<?=$contacts['facebook']?>"
							target="_blank" >
							Профиль Фейсбук
						</a>
					<?php endif ?>
					<?php if ( $contacts['twitter'] != "" ): ?>
						<a class="contacts__value--bold-link" href="<?=$contacts['twitter']?>"
							target="_blank" >
							Профиль Твиттер
						</a>
					<?php endif ?>
				</div>
			</div>
			<?php endif ?>

			<?php showContactItem('github', 'Профиль GitHub') ?>
			<?php showContactItem('phone', 'Телефон') ?>
			<?php showContactItem('address', 'Адрес') ?>

		</div>

		<div class="col-md-4">

			<!-- Вывод ошибок и успехов -->
			<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>
			<?php if ( isset($_GET['result']) ) {
				include ROOT . "templates/contacts/_results.tpl";
			} ?>
			<!-- // Вывод ошибок и успехов -->

			<form class="form-contact" action="<?=HOST?>contacts" method="POST" enctype="multipart/form-data" novalidate >
				<div class="form-contact__title">Связаться со мной</div>
				<div class="form-contact__name">
					<input name="name"
						class="input-text"
						type="text"
						placeholder="Введите имя"
						value="<?=(trim(@$_POST['name']) != '' ) ? $_POST['name'] : '';?>" />
				</div>
				<div class="form-contact__email">
					<input name="email"
						class="input-text"
						type="email"
						placeholder="Email"
						value="<?=(trim(@$_POST['email']) != '' ) ? $_POST['email'] : '';?>" />
				</div>
				<div class="form-contact__message">
					<textarea name="message"
						class="textarea"
						type="text"
						placeholder="Сообщение"><?=(trim(@$_POST['message']) != '' ) ? $_POST['message'] : '';?></textarea>
				</div>
				<div class="form-contact__load-file">
					<div class="load-file-title">Прикрепить файл </div>
					<div class="load-file-opis">jpg, png, pdf, doc, docx весом до 2Мб.</div>
					<div class="load-file-fieldset">
						<input class="inputfile inputfile-rad"
							id="file"
							type="file"
							name="file"
							data-multiple-caption="{count} файлов выбрано"
							multiple="" />
						<label for="file">Выбрать файл</label><span>Файл не выбран</span></div>
				</div>
				<div class="g-recaptcha" data-sitekey="6LcVbW0aAAAAABO7gP4bUshJB-lZx_Na7eWiy2kU" style="margin-bottom:15px;"></div>
				<div class="form-contact__save">
					<input class="button button-save"
						type="submit"
						value="Отправить"
						name="newMessage" />
				</div>
			</form>
		</div>
	</div>
</div>
<div class="map" id="map"></div>