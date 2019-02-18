<div class="sticky-footer-content">
	<div class="container user-content pt-50 pb-120 relative">
		<div class="profile__button">
			<a class="button button-edit" href="<?=HOST?>profile-edit">Редактировать</a>
		</div>
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<div class="profile">
					<div class="title-1 profile__title">Профиль</div>
				</div>
				<div class="profile-user">
					<div class="profile-user__avatar">
						<div class="avatar avatar--big">
							<?php if ( $_SESSION['logged_user']['avatar'] != '' ) { ?>
								<img src="<?=HOST?>usercontent/avatar/<?=$currentUser->avatar?>" alt="<?=$currentUser->name?> <?=$currentUser->surname?>" />
							<?php }	?>
						</div>
					</div>
					<div class="profile-user-description">
						<span>Имя и фамилия</span>
						<div class="profile-user-description__title"><?=$currentUser->name?> <?=$currentUser->surname?></div>
						<span>Email</span>
						<div class="profile-user-description__email"><?=$currentUser->email?></div>
						<span>Страна, Город</span>
						<div class="profile-user-description__city"><?=$currentUser->country?>
						<?php if ( ($currentUser->country != '') && ($currentUser->city != '') ): ?>
						, 
						<?php endif ?>
						<?=$currentUser->city?></div>
					</div>
				</div>

				<!-- Комментарии пользователя -->
				<h2 class="title-2">Комментарии пользователя</h2>

				<?php if ( count($comments) > 0 ): ?>
				 	<?php foreach ($comments as $comment): ?>
				 		<?php include ROOT . "templates/profile/_comment-card.tpl" ?>
				 	<?php endforeach ?>
				<?php else: ?>
					<div class="user-comment mb-10">
						<div class="user-comment__content">
							<p>Вы пока не оставляли комментарии на сайте.</p>
						</div>
					</div>
				<?php endif ?>
				<!-- // Комментарии пользователя -->

			</div>
		</div>
	</div>
</div>