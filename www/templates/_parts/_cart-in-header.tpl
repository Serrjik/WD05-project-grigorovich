<?php if ( isset($_COOKIE['cart']) ): ?>
	<!-- Подсчитываем количество товаров в корзине -->
	<!-- Функция array_sum() возвращает сумму значений в массиве -->
	<?php $itemsInCart = array_sum( json_decode($_COOKIE['cart'], true) ); ?>

	<?php if ( $itemsInCart > 0 ): ?>
		<div class="cart mt-80">
			<a href="<?=HOST?>cart">
				<i class="fas fa-shopping-cart"></i>
				<?=goodsNumber($itemsInCart); ?>
			</a>
		</div>
	<?php endif ?>

<?php endif ?>