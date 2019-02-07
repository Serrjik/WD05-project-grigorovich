<?php if ( $_GET['result'] == 'catCreated' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__success" data-notify-hide>
		Категория успешно добавлена!
	</div>
<?php endif ?>

<?php if ( $_GET['result'] == 'catUpdated' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__success" data-notify-hide>
		Категория успешно отредактирована!
	</div>
<?php endif ?>

<?php if ( $_GET['result'] == 'catDeleted' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__error" data-notify-hide>
		Категория успешно удалена!
	</div>
<?php endif ?>