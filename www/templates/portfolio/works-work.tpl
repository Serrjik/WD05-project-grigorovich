<div class="logo-wrapper">
	<div class="logo">
		<a href="<?=HOST?>" class="work-logo-icon" ><div class="logo__icon"><span class="ml-0"><i class="far fa-paper-plane"></i></span><span>Digital Lifestyle</span></div>
			<div class="logo__text"><span>Сайт IT специалиста</span></div></a>
	</div>
	<div class="sticky-footer-content">
		<div class="container user-content pt-85">
			<div class="row">
				<div class="blog-post col-md-10 offset-md-1 pl-0 pr-0">
					<div class="blog-post-heading-wrapper">
						<h1 class="blog-post__title title-1 blog-post__title--size"><?=$work['title']?></h1>
						<div class="blog-post__info mb-45">
							<div class="blog-post__info-name"><?=$author['name']?></div>
							<div class="blog-post__info-category"><a href="<?=HOST?>portfolio">Работы</a></div>
							<div class="blog-post__info-date">
								<?php if ( $work['update_time'] != NULL ): ?>
									<?=rus_date("j F Y", strtotime($work['update_time']))?>
								<?php else: ?>
									<?=rus_date("j F Y", strtotime($work['date_time']))?>
								<?php endif ?>
							</div>
						</div>
						<?php if ( isAdmin() ) { ?>
							<div class="blog-post__button">
								<a class="button button-edit" href="<?=HOST?>portfolio/work-edit?id=<?=$work['id']?>" >Редактировать</a>
							</div>
						<?php } ?>
					</div>
					<div>
						<img class="blog-post__image" src="<?=HOST?>usercontent/portfolio/<?=$work['work_image']?>" alt="<?=$work['title']?>" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="description-progect mt-20">
	<div class="container user-content">
		<div class="row">
			<div class="col-md-5 offset-md-1 pl-0 description-about">
				<h3 class="title-3">Кратко о проекте</h3>
				<div class="description-about__paragraph description-about__paragraph--style">
					<?=$work['text']?>
				</div>

				<?php if ( $work['result'] != '' ): ?>
					<h3 class="description-about__result description-about__result--mb">Результат</h3>
					<p class="description-about__paragraph description-about__paragraph--style">
						<?=$work['result']?>
					</p>
				<?php endif ?>
			</div>
			<div class="col-md-5 pl-10 description-technologies">
				<h3 class="title-3 description-technologies__title">Технологии</h3>
				<div class="description-technologies__list">
					<?=$work['technology']?>
				</div>

				<h3 class="title-3 description-technologies__title">Ссылка на проект</h3>
				<a href="<?=$work['link']?>" target="_ blank"><?=$work['link']?></a>

				<?php if ( $work['github'] != '' ): ?>
					<h3 class="title-3 description-technologies__title description-technologies__title--margin">Код на github</h3>
					<a href="<?=$work['github']?>" target="_ blank"><?=$work['github']?></a>
				<?php endif ?>

			</div>

			<!-- Навигация -->
			<div class="col-md-10 offset-md-1 buttons-navigation">
				<div class="buttons-navigation__backward">
					<?php if ( $prevId != '' ): ?>
						<div class="button__arrow-wrap">
							<a class="button button-backward" 
								href="<?=HOST?>portfolio/work?id=<?=$prevId?>" >
								Предыдущая работа
							</a>
							<i class="fas fa-arrow-left"></i>
						</div>
					<?php else: ?>
						<div class="button__arrow-wrap">
							<a class="button button-backward" 
								href="<?=HOST?>portfolio" >
								Все работы
							</a>
							<i class="fas fa-arrow-left"></i>
						</div>
					<?php endif ?>
				</div>

				<div class="buttons-navigation__forward">
					<?php if ( $nextId != '' ): ?>
						<div class="button__arrow-wrap">
							<a class="button button-forward" 
								href="<?=HOST?>portfolio/work?id=<?=$nextId?>" >
								Следующая работа
							</a>
							<i class="fas fa-arrow-right"></i>
						</div>
					<?php else: ?>
						<div class="button__arrow-wrap">
							<a class="button button-forward" 
								href="<?=HOST?>portfolio" >
								Все работы
							</a>
							<i class="fas fa-arrow-right"></i>
						</div>
					<?php endif ?>
				</div>
			</div>
			<!-- // Навигация -->
		</div>
	</div>
</div>