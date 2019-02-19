<div class="col-4 card-post">

	<div class="card-post__image card-goods__image mb-15">
		<?php if ( $item->img_small != "" ): ?>
			<img src="<?=HOST?>usercontent/shop/<?=$item->img_small?>" alt="<?=$item->title?>" />
		<?php else: ?>
			<img src="<?=HOST?>usercontent/no-foto.jpg" alt="<?=$item->title?>" />
		<?php endif ?>
	</div>

	<div class="card-post__title">
		<?=mbCutString($item->title, 42)?>
	</div>

	<div class="card-price-holder">
		<div class="card__price">
			<?=price_format($item['price'])?> <span>рублей</span>
		</div>
		<a class="button" 
			href="<?=HOST?>shop/item?id=<?=$item->id?>">
			Смотреть
		</a>
	</div>

</div>