<?php foreach ($errors as $error): ?>
	<?php if ( count($error) == 1 ): ?>

		<!-- Однострочная ошибка -->
		<div class="notification__error"><?=$error['title']?></div>

	<?php elseif ( count($error) == 2 ): ?>

		<!-- Ошибка с описанием -->
		<div class="notification__error--text">
			<div class="notification__error notification__error--top notification__error--top-border-radius"><?=$error['title']?></div>
			<?=$error['desc']?>
			<!-- <span class="mb-20">Используйте другой email чтобы создать новый аккаунт</span>
			<span>Или воспользуйтесь <a href="#{link}">восстановлением пароля</a>, чтобы войти на сайт.</span> -->
		</div>
	<?php endif ?>
<?php endforeach ?>