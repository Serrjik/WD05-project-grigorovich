<div class="container container-adaptive-vertical-medium-padding user-content">

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