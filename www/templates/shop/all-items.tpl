<div class="container user-content pt-80">

	<?php if ( isset($_GET['result']) ) {
		include ROOT . "templates/shop/partials/_results.tpl";
	} ?>

	<div class="blog__header flex-column-reverse flex-md-row mb-502"><span>Магазин</span>
		<?php if ( isAdmin() ) { ?>
			<a class="button button-edit mb-25 mb-md-0"
				href="<?=HOST?>shop/new">
				Добавить товар
			</a>
		<?php } ?>
	</div>

	<div class="row justify-content-around pr-15 pr-sm-0 pl-15 pl-sm-0">
		<?php foreach ($goods as $item): ?>
			<!-- Карточка товара -->
			<?php require ROOT . "templates/shop/partials/_item-card.tpl" ?>
		<?php endforeach ?>
	</div>

</div>