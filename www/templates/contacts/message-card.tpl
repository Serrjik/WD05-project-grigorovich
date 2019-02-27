<div class="message mb-20">
	<div class="message-container">
		<div class="delete"><a class="button button-delete button-small" href="<?=HOST?>message-delete?id=<?=$message->id?>">Удалить</a></div>
		<div class="message-date">
			<?=rus_date("j F Y", strtotime($message->date_time))?>
		</div>
		<div class="message-author">
			<div class="message-author--name">
				<?=$message->name?>
			</div>
			<a class="message-author--email" href="mailto:<?=$message->email?>" target="_blank">
				<?=$message->email?>
			</a>
		</div>
		<div class="message-text">
			<?=$message->message?>
		</div>
		<?php if ($message->message_file != ''): ?>
			<div class="message-files">
				<div class="message-files--title">Прикрепленный файл:</div>
				<a class="message-files--list" 
				href="<?=HOST?>usercontent/upload_files/<?=$message->message_file?>"
				target="_blank" >
				<?=$message->message_file_name_original?>
				</a>
			</div>
		<?php endif ?>
	</div>
</div>