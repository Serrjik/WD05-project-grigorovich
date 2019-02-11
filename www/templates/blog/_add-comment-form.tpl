<div class="comment mt-35 mb-120">

	<?php if ( isLoggedIn() ): ?>
		<div id="errorBox" class="registration-form__error">
			<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>
		</div>

		<div class="leave-comment-title">Оставить комментарий</div>
		<div class="leave-comment">
			<div class="leave-comment-avatar">
				<div class="avatar">
					<?php if ( $_SESSION['logged_user']['avatar_small'] != '' ) { ?>
					<img 
						src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logged_user']['avatar_small']?>" 
						alt="<?=$_SESSION['logged_user']['name']?> <?=$_SESSION['logged_user']['surname']?>" />
					<?php }	?>
				</div>
			</div>

			<form 
				id="leaveCommentForm" 
				class="leave-comment-form" 
				method="POST" 
				action="<?=HOST?>blog/post?id=<?=$post['id']?>" >
				<div class="leave-comment-form__name">
					<?=$_SESSION['logged_user']['name']?>
					<?=$_SESSION['logged_user']['surname']?>
				</div>
				<div class="notification__error" style="display: none;">Комментарий не может быть пустым.</div>
				<div class="mb-10">
					<textarea id="comment" name="commentText" class="textarea" type="text" placeholder="Присоединиться к обсуждению..."></textarea>
				</div>
				<div class="mb-10">
					<input class="button" type="submit" value="Опубликовать" name="addComment" />
				</div>
			</form>

		</div>
	<?php else: ?>
		<div class="comment__register text-center">
			<a href="<?=HOST?>login">Войдите</a> или 
			<a href="<?=HOST?>registration">зарегистрируйтесь</a><br />чтобы оставить комментарий</div>
	<?php endif ?>

</div>