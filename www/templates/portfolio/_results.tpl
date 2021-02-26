<?php if ( $_GET['result'] == 'postDeleted' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__error" data-notify-hide>
		Пост был удален!
	</div>
<?php endif ?>

<?php if ( $_GET['result'] == 'workCreated' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__success" data-notify-hide>
		Новая работа добавлена!
	</div>
<?php endif ?>

<?php if ( $_GET['result'] == 'workUpdated' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__success" data-notify-hide>
		Работа успешно отредактирована!
	</div>
<?php endif ?>