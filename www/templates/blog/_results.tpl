<?php if ( $_GET['result'] == 'postDeleted' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__error" data-notify-hide>
		Пост был удален!
	</div>
<?php endif ?>

<?php if ( $_GET['result'] == 'postCreated' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__success" data-notify-hide>
		Новый пост добавлен!
	</div>
<?php endif ?>

<?php if ( $_GET['result'] == 'postUpdated' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__success" data-notify-hide>
		Пост успешно отредактирован!
	</div>
<?php endif ?>