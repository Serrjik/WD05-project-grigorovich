<div class="container user-content pt-80 pb-80">

	<div class="title-2">Оплата заказа через Яндекс.Деньги</div>

<?php /*
echo "<pre>";
print_r($_SESSION['order']);
echo "</pre>";
*/ ?>

	<form method="POST" action="https://money.yandex.ru/quickpay/confirm.xml">    
		<input type="hidden" name="receiver" value="<?=YANDEX_WALLET?>" >
		<input type="hidden" name="formcomment" value="Онлайн покупка: <?=SITE_NAME?>" >
		<input type="hidden" name="short-dest" value="Онлайн покупка: <?=SITE_NAME?>" >

		<input type="hidden" name="label" value="<?=$_SESSION['order']['id']?>" >
		<input type="hidden" name="quickpay-form" value="shop" >
		<input type="hidden" name="targets" value="Оплата в магазине <?=SITE_NAME?> заказ № <?=$_SESSION['order']['id']?>" >
		<input type="hidden" name="sum" value="<?=$_SESSION['order']['total_price']?>" data-type="number" > <!-- Сейчас здесь сумма без учёта комиссии -->

		<!-- <input type="hidden" name="comment" value="Хотелось бы получить дистанционное управление."> -->
		<input type="hidden" name="need-fio" value="<?=$_SESSION['order']['name']?> <?=$_SESSION['order']['surname']?>" >
		<input type="hidden" name="need-email" value="<?=$_SESSION['order']['email']?>" >
		<input type="hidden" name="need-phone" value="<?=$_SESSION['order']['phone']?>" >
		<input type="hidden" name="need-address" value="<?=$_SESSION['order']['address']?>" >

		<!-- <label><input type="radio" name="paymentType" value="PC">Яндекс.Деньгами</label>
		<label><input type="radio" name="paymentType" value="AC">Банковской картой</label> -->

		<fieldset>
			<label class="form__label-radio">
				<input class="form__input-radio" 
					type="radio" 
					name="paymentType" 
					value="PC" /><span class="form__radio"></span>
					Яндекс.Деньгами
			</label>
			<label class="form__label-radio">
				<input class="form__input-radio" 
					type="radio" 
					name="paymentType" 
					value="AC" /><span class="form__radio"></span>
					Банковской картой
			</label>
		</fieldset>

		<input class="button button-save" type="submit" value="Перевести">
	</form>

</div>