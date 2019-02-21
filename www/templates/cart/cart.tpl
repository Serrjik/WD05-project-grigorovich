<div class="container user-content pt-80 pb-80">

	<?php if ( count(@$cartGoods) > 0 ): ?>
		<div class="title-1">Корзина</div>

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

	<?php else: ?>
		<div class="highlight">
			<div class="title-2">Корзина пуста</div>
		</div>
	<?php endif ?>

</div>