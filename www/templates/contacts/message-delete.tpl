<div class="sticky-footer-content">
	<div class="container user-content pt-80 pb-120">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-1 post-add__title">Удалить сообщение</div>

				<p>Вы действительно хотите удалить сообщение, которое оставил <strong><?=$message['name']?></strong><!--  с id = <?=$message['id']?> -->?</p>

				<!-- <?php require ROOT . 'templates/_parts/_errors.tpl'; ?> -->

				<form class="post-add-form" action="<?=HOST?>message-delete?id=<?=$message['id']?>" method="POST">
					<div class="post-add-form-button">
						<input class="button button-delete" type="submit" value="Удалить" name="messageDelete" />
						<div class="post-add-form-button__cancel">
							<a class="button" href="<?=HOST?>messages">Отмена</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>