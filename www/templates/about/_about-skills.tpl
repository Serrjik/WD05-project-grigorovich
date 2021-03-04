<?php function showIndicator($title, $value, $color = '') {
	$indicatorWidth = 125;
	$radius = ($indicatorWidth - 10) / 2;
	$perimeter = 2 * pi() * $radius;
	// Длина окружности P = 352 px
	$offset = $perimeter * ( 1 - intval($value)/100 );
 ?>
	<div class="indicator">
		<svg width="<?=$indicatorWidth?>" 
			height="<?=$indicatorWidth?>" 
			class="svg-box" 
			viewbox="0 0 <?=$indicatorWidth?> <?=$indicatorWidth?>">
			<circle 
				<?php if ( $color == '' ): ?>
					class="circle" 
				<?php else: ?>
					class="circle circle-<?=$color?>" 
				<?php endif ?>
				cx="<?=$indicatorWidth/2?>" 
				cy="<?=$indicatorWidth/2?>" 
				r=<?=$radius?> 
				stroke-dasharray="<?=$perimeter?>" 
				style="stroke-dashoffset:<?=$offset?>;"
			></circle>
		</svg>
		<div class="indicator__value"><?=$title?></div>
	</div>
<?php } ?>

<div id="skills" class="bg-technology">
	<div class="container user-content">
		<div class="technology">
			<div class="row">
				<div class="col-md-9 offset-md-3">
					<div class="technology-block">
						<div class="technology-block__title">Технологии<span>Которые использую в работе</span></div>

						<?php if ( isAdmin() ) { ?>
							<div class="technology-block__button"><a class="button button-edit" href="<?=HOST?>edit-skills">Редактировать</a></div>
						<?php } ?>

					</div>
				</div>
			</div>

			<div class="row mb-40">
				<div class="col-md-3 technology__title d-flex align-items-center justify-content-center">Frontend</div>
				<div class="indicators-wrapper col-md-9">
					<?=showIndicator('HTML5', $skills['html'], 'green');?>
					<?=showIndicator('CSS3', $skills['css'], 'green');?>
					<?=showIndicator('JS', $skills['js'], 'green');?>
					<?=showIndicator('jQuery', $skills['jquery'], 'green');?>
				</div>
			</div>
			<div class="row mb-40">
				<div class="col-md-3 technology__title d-flex align-items-center justify-content-center">Backend</div>
				<div class="indicators-wrapper col-md-9">
					<?=showIndicator('PHP', $skills['php'], 'blue');?>
					<?=showIndicator('MySql', $skills['mysql'], 'blue');?>
					<?=showIndicator('Node.js', $skills['nodejs'], 'blue');?>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 technology__title d-flex align-items-center justify-content-center">Workflow</div>
				<div class="indicators-wrapper col-md-9">
					<?=showIndicator('Git', $skills['git'], 'yellow');?>
					<?=showIndicator('Gulp', $skills['gulp'], 'yellow');?>
					<?=showIndicator('NPM', $skills['npm'], 'yellow');?>
					<?=showIndicator('WebPack', $skills['webpack'], 'yellow');?>
				</div>
			</div>
		</div>
	</div>
</div>