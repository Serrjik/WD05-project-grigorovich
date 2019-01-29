<!DOCTYPE html>
<html lang="ru">

<head>
	<meta charset="UTF-8" />
	<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"/><![endif]-->
	<title>Регистрация</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<!-- build:cssVendor css/vendor.css -->
	<link rel="stylesheet" href="<?=HOST?>templates/assets/libs/normalize-css/normalize.css" />
	<link rel="stylesheet" href="<?=HOST?>templates/assets/libs/bootstrap-4-grid/grid.min.css" />
	<!-- endbuild -->
	<!-- build:cssCustom css/main.css -->
	<link rel="stylesheet" href="<?=HOST?>templates/assets/css/main.css" />
	<!-- endbuild -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merriweather|Open+Sans:400,600,700,800&amp;amp;subset=cyrillic-ext" />
	<!--[if lt IE 9]><script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script><![endif]-->
</head>

<body class="content-page">
	<div class="registration-wrapper">
		<div class="registration-header-wrapper">
			<div class="logo">
				<div class="logo__icon"><span class="ml-0"><i class="far fa-paper-plane"></i></span><span>Супер Сайт</span></div>
				<div class="logo__text"><span></span></div>
			</div>
			<div class="login"><a href="#!">Вход</a></div>
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
						<p>© Юрий Ключевский</p>
						<p>Создано с <span>❤</span> в <a href="http://webcademy.ru/" target="_blank">WebCademy.ru</a> в 2018 году</p>
					</div>
				</div>
			</div>
		</div>
	</div><!-- build:jsLibs js/libs.js -->
	<script src="<?=HOST?>templates/assets/libs/jquery/jquery.min.js"></script><!-- endbuild -->
	<!-- build:jsMain js/main.js -->
	<script src="<?=HOST?>templates/assets/js/main.js"></script>
	<!-- endbuild -->
	<script defer="defer" src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</body>

</html>