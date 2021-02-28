<div class="sticky-footer-content">
	<div class="container user-content pt-80 pb-120">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-1 post-add__title">Удалить работу</div>

				<p>Вы действительно хотите удалить работу <strong><?=$work['title']?></strong><!--  с id = <?=$work['id']?>  -->?</p>

				<!-- <?php require ROOT . 'templates/_parts/_errors.tpl'; ?> -->

				<form class="post-add-form" action="<?=HOST?>portfolio/work-delete?id=<?=$work['id']?>" method="POST">
					<div class="post-add-form-button">
						<input class="button button-delete" type="submit" value="Удалить" name="workDelete" />
						<div class="post-add-form-button__cancel">
							<a class="button" href="<?=HOST?>portfolio/work-edit?id=<?=$work['id']?>">Отмена</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>