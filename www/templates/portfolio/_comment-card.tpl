<div class="two-comments-container">
	<div class="two-comments-container__avatar">
		<div class="avatar">
			<?php if ( $comment['avatar_small'] != '' ) { ?>
			<img 
				src="<?=HOST?>usercontent/avatar/<?=$comment['avatar_small']?>" 
				alt="<?=$comment['name']?> <?=$comment['surname']?>" />
			<?php }	?>
		</div>
	</div>
	<div class="two-comments-container-block">
		<div class="two-comments-container-block-wrap">
			<div class="two-comments-container-block-wrap__name">
				<?=$comment['name']?> <?=$comment['surname']?>
			</div>
			<div class="two-comments-container-block-wrap__date"><i class="far fa-clock two-comments-container-block-wrap-icon"></i>
				<?=rus_date("j F Y H:i", strtotime($comment['date_time']));?>
			</div>
		</div>
		<div class="two-comments-container-block__message">
			<?=$comment['text']?>
		</div>
	</div>
</div>