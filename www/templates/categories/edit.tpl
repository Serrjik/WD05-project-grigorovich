<div class="sticky-footer-content">
	<div class="container container-adaptive-vertical-padding user-content">
		<div class="row">
			<div class="col-sm-10 offset-sm-1">
				<div class="title-1 post-add__title">Редактировать новую категорию</div>

				<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>

				<form class="post-add-form" action="<?=HOST?>blog/category-edit?id=<?=$cat['id']?>" method="POST">
					<div class="post-add-form__name">
						<label class="label">Название категории
							<input class="input-text" type="text" name="catTitle" placeholder="Введите название" value="<?=$cat['cat_title']?>" />
						</label>
					</div>
					<div class="post-add-form-button">
						<input class="button button-save mr-20 mb-20" type="submit" value="Сохранить" name="catEdit" />
						<div class="post-add-form-button__cancel">
							<a class="button" href="<?=HOST?>blog/categories">Отмена</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>