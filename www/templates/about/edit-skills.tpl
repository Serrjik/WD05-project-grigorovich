<?php function skillItem($name, $title) { ?>
	<div class="col-md-3 technology-edit-form__item">
		<label class="label"><?=$title?>
			<input class="input-text input-text--width" 
				type="text" 
				placeholder="0" 
				name="<?=$name?>" />
		</label>
		<div class="percent-sign"><span class="percent-sign__item">%</span></div>
	</div>
<?php } ?>

<div class="sticky-footer-content">
	<div class="container user-content pt-45 pl-0">
		<div class="row">
			<div class="offset-md-1 col-md-8">
				<h1 class="title-1">Редактировать - Технологии</h1>
				<form class="technology-edit-form" 
					action="edit-skills" 
					method="POST" >


					<div class="row technology-edit-form__row">
						<?=skillItem('html', 'HTML5');?>
						<?=skillItem('css', 'CSS3');?>
						<?=skillItem('js', 'JS');?>
						<?=skillItem('jquery', 'jQuery');?>
					</div>

					<div class="row technology-edit-form__row">
						<div class="col-md-3 technology-edit-form__item"><label class="label">PHP<input class="input-text input-text--width" type="text" placeholder="0" name="php" /></label>
							<div class="percent-sign"><span class="percent-sign__item">%</span></div>
						</div>
						<div class="col-md-3 technology-edit-form__item"><label class="label">MySql<input class="input-text input-text--width" type="text" placeholder="0" name="mysql" /></label>
							<div class="percent-sign"><span class="percent-sign__item">%</span></div>
						</div>
					</div>
					<div class="row technology-edit-form__row mb-30">
						<div class="col-md-3 technology-edit-form__item"><label class="label">Git<input class="input-text input-text--width" type="text" placeholder="0" name="git" /></label>
							<div class="percent-sign"><span class="percent-sign__item">%</span></div>
						</div>
						<div class="col-md-3 technology-edit-form__item"><label class="label">Gulp<input class="input-text input-text--width" type="text" placeholder="0" name="gulp" /></label>
							<div class="percent-sign"><span class="percent-sign__item">%</span></div>
						</div>
						<div class="col-md-3 technology-edit-form__item"><label class="label">Bower<input class="input-text input-text--width" type="text" placeholder="0" name="bower" /></label>
							<div class="percent-sign"><span class="percent-sign__item">%</span></div>
						</div>
						<div class="col-md-3 technology-edit-form__item"><label class="label">WebPack<input class="input-text input-text--width" type="text" placeholder="0" name="webpack" /></label>
							<div class="percent-sign"><span class="percent-sign__item">%</span></div>
						</div>
					</div>
					<div class="row technology-edit-form__row">
						<div class="technology-edit-form__button"><input class="button button-save" type="submit" value="Сохранить" name="technology-edit" /></div>
						<div class="technology-edit-form__button-cancel"><button class="button" type="reset">Отмена</button></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>