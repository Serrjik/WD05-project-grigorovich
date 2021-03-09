<div class="card-post">
	<div class="card-post__image-holder mb-15">

		<?php if ( $post->post_img_small != "" ): ?>
			<img class="card-post__image"
			src="<?=HOST?>usercontent/blog/<?=$post->post_img_small?>"
			alt="<?=$post->title?>" />
		<?php else: ?>
			<img class="card-post__image"
			src="<?=HOST?>usercontent/no-foto.jpg"
			alt="<?=$post->title?>" />
		<?php endif ?>

	</div>
	<div class="card-post__title">
		<?=mbCutString($post->title, 43)?>
	</div>
	<a class="button card-post__button" href="<?=HOST?>blog/post?id=<?=$post->id?>">Читать</a>
</div>