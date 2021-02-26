<div class="container user-content pt-80 pb-80">

	<div class="title-2">
		Состав заказа № <?=$order->id?>
	</div>

	<table class="table table-hover">
		<thead>
			<tr class="table-total">
				<td>Наименование</td>
				<td>Количество</td>
				<td width="200">Стоимость</td>
			</tr>
		</thead>
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
		<tbody>
			<?php foreach ( $orderItems as $item ): ?>
				<?php include ROOT . "templates/orders/_item-in-order-table-history.tpl" ?>
			<?php endforeach ?>
		</tbody>
	</table>

	<a href="<?=HOST?>myorders" 
		class="button" >
			← Назад к моим заказам
	</a>

</div>