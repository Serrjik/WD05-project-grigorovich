<div class="card-portfolio">
	<div class="card-portfolio__image mb-15">
		<img src="<?=HOST?>usercontent/portfolio/<?=$work->work_image_small ?>" alt="<?=$work->title?>" />
	</div>
	<div class="card-portfolio__title ml-20">
		<?=mbCutString($work->title, 26)?>
	</div>
	<a class="button" 
		href="<?=HOST?>portfolio/work?id=<?=$work->id?>">
		Смотреть кейс
	</a>
</div>