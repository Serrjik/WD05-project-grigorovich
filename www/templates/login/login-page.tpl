<body class="content-page">
	<div class="registration-wrapper">
		<div class="registration-header-wrapper">
			<div class="logo">
				<a href="<?=HOST?>" 
					class="logo__icon" >
					<span class="ml-0"><i class="far fa-paper-plane"></i></span><span>Супер Сайт</span>
				</a>
			</div>
			<div class="login">
				<?php if ( $uri[0] == 'registration' ): ?>
					<a href="<?=HOST?>login">Вход</a>
				<?php else: ?>
					<a href="<?=HOST?>registration">Регистрация</a>
				<?php endif ?>
			</div>
		</div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-4">
					<!-- Форма регистрации из файла form-registration.tpl -->
					<?=$content?>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-4">
					<div class="footer__text text-center">
						<p>© Сергей Григорович</p>
						<p>Создано с <span>❤</span> в <a href="http://webcademy.ru/" target="_blank">WebCademy.ru</a> в 2018 году</p>
					</div>
				</div>
			</div>
		</div>
	</div>