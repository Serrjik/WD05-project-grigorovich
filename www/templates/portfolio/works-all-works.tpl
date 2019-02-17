<div class="container user-content pt-80">

	<?php if ( isset($_GET['result']) ) {
		include ROOT . "templates/portfolio/_results.tpl";
	} ?>

	<div class="works__header mb-50">
		<span><strong>Мои работы</strong></span>
		<?php if ( isAdmin() ) { ?>
			<a class="button button-edit" 
				href="<?=HOST?>portfolio/work-new">
				Добавить работу
			</a>
		<?php } ?>
	</div>

	<div class="row mb-50">
		<?php foreach ($works as $work): ?>
			<!-- Карточка работы -->
			<?php require ROOT . "templates/_parts/_portfolio-card.tpl" ?>
		<?php endforeach ?>
	</div>
</div>