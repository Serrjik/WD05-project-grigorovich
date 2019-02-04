<?php foreach ($success as $successItem): ?>
	<?php if ( count($successItem) == 1 ): ?>

		<!-- Однострочная ошибка -->
		<div class="notification__success"><?=$successItem['title']?></div>

	<?php elseif ( count($successItem) == 2 ): ?>

		<!-- Ошибка с описанием -->
		<div class="notification__error--text">
			<div class="notification__error notification__success notification__error--top notification__success--top-border-radius"><?=$successItem['title']?></div>
			<?=$successItem['desc']?>
		</div>
	<?php endif ?>
<?php endforeach ?>