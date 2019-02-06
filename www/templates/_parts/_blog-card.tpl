<div class="card-post">
	<div class="card-post__image mb-15">

		<?php if ( $post->post_img_small != "" ): ?>
			<img src="<?=HOST?>usercontent/blog/<?=$post->post_img_small?>" alt="<?=$post->title?>" />
		<?php else: ?>
			<img src="<?=HOST?>usercontent/no-foto.jpg" alt="<?=$post->title?>" />
		<?php endif ?>

	</div>
	<div class="card-post__title">
		<?=mbCutString($post->title, 43)?>
	</div>
	<a class="button" href="<?=HOST?>blog/post?id=<?=$post->id?>">Читать</a>
</div>