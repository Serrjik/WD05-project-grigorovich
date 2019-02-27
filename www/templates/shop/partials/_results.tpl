<?php if ( $_GET['result'] == 'itemDeleted' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__error" data-notify-hide>
		Товар был удален!
	</div>
<?php endif ?>

<?php if ( $_GET['result'] == 'itemCreated' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__success" data-notify-hide>
		Новый товар добавлен!
	</div>
<?php endif ?>

<?php if ( $_GET['result'] == 'itemUpdated' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__success" data-notify-hide>
		Товар успешно отредактирован!
	</div>
<?php endif ?>