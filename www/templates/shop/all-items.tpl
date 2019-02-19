<div class="container user-content pt-80">

	<?php if ( isset($_GET['result']) ) {
		include ROOT . "templates/shop/partials/_results.tpl";
	} ?>

	<div class="blog__header mb-50"><span>Магазин</span>
		<?php if ( isAdmin() ) { ?>
			<a class="button button-edit" 
				href="<?=HOST?>shop/new">
				Добавить товар
			</a>
		<?php } ?>
	</div>

	<div class="row">
		<?php foreach ($goods as $item): ?>
			<!-- Карточка товара -->
			<?php require ROOT . "templates/shop/partials/_item-card.tpl" ?>
		<?php endforeach ?>
	</div>

</div>