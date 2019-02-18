<div class="sticky-footer-content">
	<div class="container user-content pt-70 make-relative">
		<div class="row">
			<div class="col-10 offset-1">
			<?php if ( isAdmin() ) { ?>
				<div class="blog__button--edit">
					<a class="button button-edit" href="<?=HOST?>blog/post-edit?id=<?=$post['id']?>" />Редактировать</a>
					<a class="button button-delete" href="<?=HOST?>blog/post-delete?id=<?=$post['id']?>" />Удалить</a>
				</div>
			<?php } ?>
				<div class="blog-post">
					<div class="blog-post-heading-wrapper">
						<h1 class="blog-post__title title-1"><?=$post['title']?></h1>
						<div class="blog-post__info">
							<div class="blog-post__info-name"><?=$post['name']?> <?=$post['surname']?></div>
							<div class="blog-post__info-category"><a href="#!"><?=$post['cat_title']?></a></div>
							<div class="blog-post__info-date">
								<?php if ( $post['update_time'] != NULL ): ?>
									<?=rus_date("j F Y H:i", strtotime($post['update_time']))?>
								<?php else: ?>
									<?=rus_date("j F Y H:i", strtotime($post['date_time']))?>
								<?php endif ?>
							</div>
							<?php if ( count($comments) > 0 ): ?>
								<div class="blog-post__info-comment-count">
									<a href="#comments">
										<?=commentNumber(count($comments));?>
									</a>
								</div>
							<?php endif ?>
						</div>
					</div>

					<?php if ( $post['post_img'] != "" ): ?>
						<img class="blog-post__image" src="<?=HOST?>usercontent/blog/<?=$post['post_img']?>" alt="<?=$post['title']?>" />
					<?php endif ?>

					<div class="blog-post__content">
						<?=$post['text']?>
					</div>
				</div>

				<div class="blog__buttons mt-30 mb-35">
					<?php if ( $prevId != '' ): ?>
						<div class="button__arrow-wrap">
							<a class="button button-backward" 
								href="<?=HOST?>blog/post?id=<?=$prevId?>" >
								Назад
							</a>
							<i class="fas fa-arrow-left"></i>
						</div>
					<?php else: ?>
						<div></div>
					<?php endif ?>
					
					<?php if ( $nextId != '' ): ?>
						<div class="button__arrow-wrap">
							<a class="button button-forward" 
								href="<?=HOST?>blog/post?id=<?=$nextId?>"" >
								Вперед
							</a>
							<i class="fas fa-arrow-right"></i>
						</div>
					<?php endif ?>
				</div>

				<!-- Комментарии -->
				<?php if ( count($comments) > 0 ): ?>
				 	<!-- Заголовок (количество комментариев) -->
				 	<div id="comments" class="two-comments__title"><?=commentNumber(count($comments));?></div>
				 	<?php foreach ($comments as $comment): ?>
				 		<?php include ROOT . "templates/blog/_comment-card.tpl" ?>
				 	<?php endforeach ?>
				<?php endif ?>
				<!-- // Комментарии -->

				<!-- Добавление комментария -->
				<?php include ROOT . "templates/blog/_add-comment-form.tpl" ?>
				<!-- // Добавление комментария -->

			</div>
		</div>
	</div>
</div>