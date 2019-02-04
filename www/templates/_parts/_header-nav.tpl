<div class="header__nav ml-55">
	<nav class="navigation">
		<ul>
			<li class="navigation__item <?=($uri[0] == "") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>">Главная</a></li>
			<li class="navigation__item <?=($uri[0] == "about") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>about">Обо мне</a></li>
			<li class="navigation__item <?=($uri[0] == "portolio") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>portolio">Работы</a></li>
			<li class="navigation__item <?=($uri[0] == "blog") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>blog">Блог</a></li>
			<li class="navigation__item <?=($uri[0] == "contacts") ? "navigation__item--active" : ""?>"><a href="<?=HOST?>contacts">Контакты</a></li>
		</ul>
	</nav>
</div>