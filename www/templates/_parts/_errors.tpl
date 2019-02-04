<?php foreach ($errors as $error): ?>
	<?php if ( count($error) == 1 ): ?>

		<!-- Однострочная ошибка -->
		<div class="notification__error"><?=$error['title']?></div>

	<?php elseif ( count($error) == 2 ): ?>

		<!-- Ошибка с описанием -->
		<div class="notification__error--text">
			<div class="notification__error notification__error--top notification__error--top-border-radius"><?=$error['title']?></div>
			<?=$error['desc']?>
		</div>
	<?php endif ?>
<?php endforeach ?>