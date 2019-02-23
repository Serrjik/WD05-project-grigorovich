<div class="container user-content pt-80 pb-80">

	<div class="title-1">Мои заказы</div>

	<table class="table">
		<tbody>
			<?php foreach ( $myOrders as $order ): ?>
				<?php include ROOT . "templates/orders/_myorder-item-in-table.tpl" ?>
			<?php endforeach ?>
		</tbody>
	</table>

</div>