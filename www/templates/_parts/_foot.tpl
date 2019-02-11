	<!-- build:jsLibs js/libs.js -->
	<script src="<?=HOST?>templates/assets/libs/jquery/jquery.min.js"></script><!-- endbuild -->
	<!-- build:js Main js/main.js -->
	<script src="<?=HOST?>templates/assets/js/main.js"></script>
	<!-- Скрипт для проверки поля ввода формы восстановления пароля -->
	<?php if ( @$_SERVER['REDIRECT_URL'] == '/lost-password'): ?>
		<script src="<?=HOST?>templates/assets/js/check-lost-password-form.js"></script>
	<?php endif ?>
	<!-- Скрипт для отображения имени файла прикрепленной картинки -->
	<?php if ( (@$_SERVER['REDIRECT_URL'] == '/profile-edit') || (@$_SERVER['REDIRECT_URL'] == '/blog/post-new') || (@$_SERVER['REDIRECT_URL'] == '/blog/post-edit') ): ?>
		<script src="<?=HOST?>templates/assets/js/custom-file-input.js"></script>
	<?php endif ?>
	<!-- Скрипт для проверки поля ввода формы восстановления пароля -->
	<?php if ( @$_SERVER['REDIRECT_URL'] == '/set-new-password'): ?>
		<script src="<?=HOST?>templates/assets/js/check-setNewPasswordForm.js"></script>
	<?php endif ?>
	<!-- Скрипт для проверки поля ввода формы комментария к посту блога -->
	<?php if ( @$_SERVER['REDIRECT_URL'] == '/blog/post'): ?>
		<script src="<?=HOST?>templates/assets/js/check-leaveCommentForm.js"></script>
	<?php endif ?>

	<!-- endbuild -->
	<script defer="defer" src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</body>
</html>