<div class="header__nav">
	<nav class="navigation">
		<ul>
			<li class="navigation__item mb-3 mb-lg-0 <?=($uri[0] == "") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>">Главная</a></li>
			<li class="navigation__item mb-3 mb-lg-0 <?=($uri[0] == "about") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>about">Обо мне</a></li>
			<li class="navigation__item mb-3 mb-lg-0 <?=($uri[0] == "portfolio") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>portfolio">Работы</a></li>
			<li class="navigation__item mb-3 mb-lg-0 <?=($uri[0] == "blog") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>blog">Блог</a></li>
			<li class="navigation__item mb-3 mb-lg-0 <?=($uri[0] == "shop") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>shop">Магазин</a></li>
			<li class="navigation__item mb-3 mb-lg-0 <?=($uri[0] == "contacts") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>contacts">Контакты</a></li>
		</ul>
	</nav>
</div>