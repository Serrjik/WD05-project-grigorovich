<div class="user-comment mb-10">
	<div class="user-comment-wrap">
		<div class="user-comment-wrap__title">
			<a class="user-comment-wrap__link" 
				href="<?=HOST?>blog/post?id=<?=$comment['id']?>" 
				target="_blanck">
				<?=$comment['title']?>
			</a>
		</div>
		<div class="user-comment-wrap__date"><i class="far fa-clock user-comment-wrap__icon"></i>
			<?=rus_date("j F Y года в H:i", strtotime($comment['date_time']));?>
		</div>
	</div>
	<div class="user-comment__content">
		<?=$comment['text']?>
	</div>
</div>