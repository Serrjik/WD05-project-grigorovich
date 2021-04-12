<div class="container container-adaptive-vertical-padding user-content">
	<div class="row">
		<div class="col-sm-10 offset-sm-1">
			<div class="title-1 post-add__title">Удалить категорию</div>

			<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>

			<p>Вы действительно хотите удалить категорию <strong><?=$cat['cat_title']?></strong>?</p>

			<form class="post-add-form" action="<?=HOST?>blog/category-delete?id=<?=$cat['id']?>" method="POST">
				<div class="post-add-form-button">
					<input class="button button-delete mr-20 mb-20" type="submit" value="Удалить" name="catDelete" />
					<div class="post-add-form-button__cancel">
						<a class="button" href="<?=HOST?>blog/categories">Отмена</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
