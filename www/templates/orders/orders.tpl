<div class="container user-content pt-80 pb-80">

	<div class="title-1">Заказы в системе</div>

	<div class="table-responsive">
		<table class="table">
			<tbody>
				<?php foreach ( $orders as $order ): ?>
					<?php include ROOT . "templates/orders/_order-item-in-table.tpl" ?>
				<?php endforeach ?>
			</tbody>
		</table>
	</div>

</div>