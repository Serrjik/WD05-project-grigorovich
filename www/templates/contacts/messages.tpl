<div class="sticky-footer-content">
	<div class="container user-content container-adaptive-vertical-padding">
		<div class="row">
			<div class="offset-lg-1 col-lg-10">
				<div class="title-1">Сообщения от посетителей</div>

				<?php foreach ($messages as $message) {
					require ROOT . "templates/contacts/message-card.tpl";
				} ?>

			</div>
		</div>
	</div>
</div>