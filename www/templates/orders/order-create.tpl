<div class="container user-content pt-80 pb-80">

	<div class="title-2">Состав заказа</div>

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

	<div class="title-1">Оформить заказ</div>

	<form action="<?=HOST?>order-create" method="POST" >
		<!-- row -->
		<div class="row">
			<div class="col-6">
				<label class="label">Имя
					<?php if ( isset($_SESSION['logged_user']['name']) ): ?>
						<input class="input-text" 
							type="text" 
							name="name" 
							placeholder="Введите имя" 
							value="<?=$_SESSION['logged_user']['name']?>" />
					<?php else: ?>
						<input class="input-text" 
							type="text" 
							name="name" 
							placeholder="Введите имя" />
					<?php endif ?>
				</label>
			</div>
			<div class="col-6">
				<label class="label">Фамилия
					<?php if ( isset($_SESSION['logged_user']['surname']) ): ?>
						<input class="input-text" 
							type="text" 
							name="surname" 
							placeholder="Введите фамилию" 
							value="<?=$_SESSION['logged_user']['surname']?>" />
					<?php else: ?>
						<input class="input-text" 
							type="text" 
							name="surname" 
							placeholder="Введите фамилию" />
					<?php endif ?>
				</label>
			</div>
		</div>
		<!-- // row -->

		<!-- row -->
		<div class="row">
			<div class="col-6">
				<label class="label">Email
					<?php if ( isset($_SESSION['logged_user']['email']) ): ?>
						<input class="input-text" 
							type="email" 
							name="email" 
							placeholder="Введите email" 
							value="<?=$_SESSION['logged_user']['email']?>" />
					<?php else: ?>
						<input class="input-text" 
							type="email" 
							name="email" 
							placeholder="Введите email" />
					<?php endif ?>
				</label>
			</div>
			<div class="col-6">
				<label class="label">Телефон
					<input class="input-text" 
						type="text" 
						name="phone" 
						placeholder="Введите телефон" 
						value="555-55-55" />
				</label>
			</div>
		</div>
		<!-- // row -->

		<label class="label">Адрес доставки
			<input class="input-text" 
				type="text" 
				name="address" 
				placeholder="Введите адрес доставки" 
				value="555-55-55" />
		</label>

		<input class="button button-save" 
			type="submit" 
			name="createOrder" 
			value="Оформить заказ" />


	</form>

</div>