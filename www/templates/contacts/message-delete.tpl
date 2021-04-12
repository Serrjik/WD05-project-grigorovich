<div class="sticky-footer-content">
	<div class="container container-adaptive-vertical-padding user-content">
		<div class="row">
			<div class="col-sm-10 offset-sm-1">
				<div class="title-1 post-add__title">Удалить сообщение</div>

				<p>Вы действительно хотите удалить сообщение, которое оставил <strong><?=$message['name']?></strong><!--  с id = <?=$message['id']?> -->?</p>

				<!-- <?php require ROOT . 'templates/_parts/_errors.tpl'; ?> -->

				<form class="post-add-form" action="<?=HOST?>message-delete?id=<?=$message['id']?>" method="POST">
					<div class="post-add-form-button">
						<input class="button button-delete mr-20 mb-20" type="submit" value="Удалить" name="messageDelete" />
						<div class="post-add-form-button__cancel">
							<a class="button" href="<?=HOST?>messages">Отмена</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>