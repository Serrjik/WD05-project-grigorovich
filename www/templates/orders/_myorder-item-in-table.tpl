<tr>
	<td scope="row">
		<a href="<?=HOST?>myorder?id=<?=$order->id?>">
			Заказ № <?=$order->id?>
		</a>
	</td>
	<td>
		<?=$order->date_time?>
	</td>
	<td>
		<?=$order->total_price?> рублей
	</td>
	<?php if ( $order->payment == 'yes' ): ?>
		<td class="text-success">
			Оплачен
		</td>
		<td></td>
	<?php else: ?>
		<td class="text-danger">
			Не оплачен
		</td>
		<td>
			<a href="<?=HOST?>payment-choice?id=<?=$order->id?>" 
				class="badge" >
				Оплатить
			</a>
		</td>
	<?php endif ?>
</tr>