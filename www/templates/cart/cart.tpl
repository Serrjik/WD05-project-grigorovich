<div class="container user-content container-adaptive-vertical-medium-padding">

	<?php if ( count(@$cartGoods) > 0 ): ?>
		<div class="title-1">Корзина</div>

		<div class="table-responsive mb-20">
			<table class="table cart-table">
				<thead>
					<tr class="table-total">
						<td></td>
						<td>Наименование</td>
						<td>Количество</td>
						<td width="200">Стоимость за ед.</td>
						<td width="200">Стоимость всего</td>
						<td></td>
					</tr>
				</thead>
				<tfoot>
					<tr class="table-total">
						<td></td>
						<td></td>
						<td><?=$cartGoodsCount?> шт.</td>
						<td></td>
						<td><?=price_format($cartGoodsTotalPrice);?> руб.</td>
						<td></td>
					</tr>
				</tfoot>
				<tbody>
					<?php foreach ( $cartGoods as $item ): ?>
						<?php include ROOT . "templates/cart/_cart-item-in-table.tpl" ?>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>

		<a href="<?=HOST?>order-create" class="button button-save">
			Оформить заказ
		</a>

	<?php else: ?>
		<div class="highlight">
			<div class="title-2">Корзина пуста</div>
		</div>
	<?php endif ?>

</div>