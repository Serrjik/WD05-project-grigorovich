<?php if ( $_GET['result'] == 'jobDeleted' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__error" data-notify-hide>
		Место работы было удалено!
	</div>
<?php endif ?>

<?php if ( $_GET['result'] == 'jobUpdated' ): ?>
	<!-- Однострочная нотификация об успехе -->
	<div class="notification__success" data-notify-hide>
		Место работы успешно отредактировано!
	</div>
<?php endif ?>