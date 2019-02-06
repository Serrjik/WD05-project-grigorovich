<div class="sticky-footer-content">
	<div class="container user-content pt-80 pb-120">

		<?php if ( isset($_GET['result']) ) {
			include ROOT . "templates/categories/_results.tpl";
		} ?>

		<div class="row">
			<div class="col-10 offset-1 blog__header mb-50"><span>Категории блога</span>
				<a class="button button-edit" href="<?=HOST?>blog/category-new">Добавить категорию</a>
			</div>

			<div class="col-10 offset-1">

				<p>Тут будут все категории</p>

			</div>
		</div>
	</div>
</div>