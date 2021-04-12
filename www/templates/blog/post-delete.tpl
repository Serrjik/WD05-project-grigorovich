<div class="container container-adaptive-vertical-padding user-content">
	<div class="row">
		<div class="col-sm-10 offset-sm-1">
			<div class="title-1 post-add__title">Удалить пост в блоге</div>

			<p>Вы действительно хотите удалить пост <strong><?=$post['title']?></strong><!--  с id = <?=$post['id']?>  -->?</p>

			<!-- <?php require ROOT . 'templates/_parts/_errors.tpl'; ?> -->

			<form class="post-add-form" action="<?=HOST?>blog/post-delete?id=<?=$post['id']?>" method="POST">
				<div class="post-add-form-button">
					<input class="button button-delete mr-20" type="submit" value="Удалить" name="postDelete" />
					<div class="post-add-form-button__cancel">
						<a class="button" href="<?=HOST?>blog/categories">Отмена</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>