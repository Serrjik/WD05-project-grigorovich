<div class="container user-content pt-70 pb-50 make-relative">
	<!-- row -->
	<div class="row">
		<div class="col-10 offset-1">

			<div class="blog-post">
				<h1 class="blog-post__title title-1">Страница товара</h1>

				<?php if ( isAdmin() ) { ?>
					<div class="blog__button--edit">
						<a class="button button-edit" 
							href="<?=HOST?>shop/item-edit?id=<?=$item['id']?>" />
							Редактировать
						</a>
						<a class="button button-delete" 
							href="<?=HOST?>shop/item-delete?id=<?=$item['id']?>" />
							Удалить
						</a>
					</div>
				<?php } ?>
			</div>
	
			<!-- row -->
			<div class="row">

				<?php if ( $item['img'] != "" ): ?>
					<div class="col-6">
						<img class="blog-post__image mt-30" 
							src="<?=HOST?>usercontent/shop/<?=$item['img']?>" 
							alt="<?=$item['title']?>" />
					</div>
				<?php endif ?>

				<!-- Item description -->
				<div class="col-6">

					<h1 class="title-1"><?=$item['title']?></h1>

					<div class="price-holder">
						<?php if ( $item['price_old'] ): ?>
							<div class="price-old">
								<?=price_format($item['price_old'])?>
							</div>
						<?php endif ?>

						<div class="price">
							<?=price_format($item['price'])?> <span>рублей</span>
						</div>
					</div>

					<a href="#!" class="button mb-15" id="addToCart">В корзину</a>

					<?=$item['desc']?>
				</div>
				<!-- END - Item description -->

			</div>
			<!-- END - row -->
		</div>
	</div>
	<!-- END - row -->
</div>