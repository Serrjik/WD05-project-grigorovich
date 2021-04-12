<div class="container user-content container-order">

	<div class="title-2">
		Состав заказа № <?=$order->id?>
	</div>

	<div class="table-responsive mb-10">
		<table class="table table-hover">
			<thead>
				<tr class="table-total">
					<th>Наименование</th>
					<th>Количество</th>
					<th width="200">Стоимость</th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ( $orderItems as $item ): ?>
					<?php include ROOT . "templates/orders/_item-in-order-table-history.tpl" ?>
				<?php endforeach ?>
			</tbody>
			<tfoot>
				<tr class="table-total">
					<td></td>
					<td scope="row">
						<strong>
							<?=goodsNumber($order->items_count);?>
						</strong>
					</td>
					<td>
						<strong>
							<?=price_format($order->total_price);?> рублей
						</strong>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>

	<a href="<?=HOST?>orders"
		class="button" >
			← Назад к заказам
	</a>

</div>