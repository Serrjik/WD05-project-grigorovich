<?php function skillItem($name, $title) {
	global $skills; ?>
	<div class="col-md-3 technology-edit-form__item">
		<label class="label"><?=$title?>
			<input class="input-text input-text--width" 
				type="number" 
				min="0" 
				max="100" 
				placeholder="0" 
				name="<?=$name?>"
				value="<?=$skills[$name]?>" 
				data-skill />
				<span class="validity"></span>
		</label>
		<div class="percent-sign"><span class="percent-sign__item">%</span></div>
	</div>
<?php } ?>

<div class="sticky-footer-content">
	<div class="container user-content pt-45 pl-0">
		<div class="row">
			<div class="offset-md-1 col-md-8">
				<h1 class="title-1">Редактировать - Технологии</h1>

				<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>

				<form class="technology-edit-form" 
					action="<?=HOST?>edit-skills" 
					method="POST" >

					<div class="row technology-edit-form__row">
						<?=skillItem('html', 'HTML5');?>
						<?=skillItem('css', 'CSS3');?>
						<?=skillItem('js', 'JS');?>
						<?=skillItem('jquery', 'jQuery');?>
					</div>

					<div class="row technology-edit-form__row">
						<?=skillItem('php', 'PHP');?>
						<?=skillItem('wp', 'WordPress');?>
						<?=skillItem('mysql', 'MySql');?>
						<?=skillItem('nodejs', 'Node.js');?>
					</div>

					<div class="row technology-edit-form__row mb-30">
						<?=skillItem('git', 'Git');?>
						<?=skillItem('gulp', 'Gulp');?>
						<?=skillItem('npm', 'NPM');?>
						<?=skillItem('webpack', 'WebPack');?>
					</div>

					<div class="row technology-edit-form__row">
						<div class="technology-edit-form__button">
							<input class="button button-save" 
								type="submit" 
								value="Сохранить" 
								name="skillsUpdate" />
						</div>
						<div class="technology-edit-form__button-cancel">
							<a class="button" 
								href="<?=HOST?>about#skills">
							Отмена</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>