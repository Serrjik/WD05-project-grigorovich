<div class="brief-resume">
	<?php require_once ROOT . "templates/about/_about-text.tpl"; ?>
</div>
<div class="hr-line"></div>
<!-- Новые работы -->
<div class="container container-adaptive-medium-padding-top user-content mb-30">
	<div class="works__header mb-25 title-1 justify-content-center justify-content-lg-start">
		<span><strong>Новые <a href="<?=HOST?>portfolio" target="_blank">работы</a></strong></span>
	</div>
	<div class="row justify-content-around pr-15 pr-sm-0 pl-15 pl-sm-0">
		<?php foreach ($works as $work): ?>
			<!-- Карточка работы -->
			<?php require ROOT . "templates/_parts/_portfolio-card.tpl" ?>
		<?php endforeach ?>
	</div>
</div>
<!-- Новые записи в блоге -->
<div class="container user-content mb-55">
	<div class="works__header mb-40 title-1 justify-content-center justify-content-lg-start">
		<span><strong>Новые записи в <a href="<?=HOST?>blog" target="_blank">блоге</a></strong></span>
	</div>
	<div class="row justify-content-around pr-15 pr-sm-0 pl-15 pl-sm-0">
		<?php foreach ($posts as $post): ?>
			<!-- Карточка блога -->
			<?php require ROOT . "templates/_parts/_blog-card.tpl" ?>
		<?php endforeach ?>
	</div>
</div>