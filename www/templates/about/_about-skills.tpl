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
				<div class="col-md-9">
					<div class="indicator">
						<svg class="svg-box" viewbox="0 0 125 125">
							<circle class="circle circle-green" style="stroke-dashoffset:35.18;"> </circle>
						</svg>
						<div class="indicator__value">HTML5</div>
					</div>
					<div class="indicator"><svg class="svg-box" viewbox="0 0 125 125">
							<circle class="circle circle-green" style="stroke-dashoffset:130.92;"> </circle>
						</svg>
						<div class="indicator__value">CSS3</div>
					</div>
					<div class="indicator"><svg class="svg-box" viewbox="0 0 125 125">
							<circle class="circle circle-green" style="stroke-dashoffset:35.18;"> </circle>
						</svg>
						<div class="indicator__value">JS</div>
					</div>
					<div class="indicator"><svg class="svg-box" viewbox="0 0 125 125">
							<circle class="circle circle-green" style="stroke-dashoffset:0;"> </circle>
						</svg>
						<div class="indicator__value">jQuery</div>
					</div>
				</div>
			</div>
			<div class="row mb-40">
				<div class="col-md-3 technology__title d-flex align-items-center justify-content-center">Backend</div>
				<div class="col-md-9">
					<div class="indicator"><svg class="svg-box" viewbox="0 0 125 125">
							<circle class="circle circle-blue" style="stroke-dashoffset:35.18;"></circle>
						</svg>
						<div class="indicator__value">PHP</div>
					</div>
					<div class="indicator"><svg class="svg-box" viewbox="0 0 125 125">
							<circle class="circle circle-blue" style="stroke-dashoffset:130.92;"></circle>
						</svg>
						<div class="indicator__value">MySql</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 technology__title d-flex align-items-center justify-content-center">Workflow</div>
				<div class="col-md-9">
					<div class="indicator"><svg class="svg-box" viewbox="0 0 125 125">
							<circle class="circle circle circle-yellow" style="stroke-dashoffset:35.18;"></circle>
						</svg>
						<div class="indicator__value">Git</div>
					</div>
					<div class="indicator"><svg class="svg-box" viewbox="0 0 125 125">
							<circle class="circle circle circle-yellow" style="stroke-dashoffset:130.92;"></circle>
						</svg>
						<div class="indicator__value">Gulp</div>
					</div>
					<div class="indicator"><svg class="svg-box" viewbox="0 0 125 125">
							<circle class="circle circle circle-yellow" style="stroke-dashoffset:35.18;"></circle>
						</svg>
						<div class="indicator__value">Bower</div>
					</div>
					<div class="indicator"><svg class="svg-box" viewbox="0 0 125 125">
							<circle class="circle circle circle-yellow" style="stroke-dashoffset:undefined;"></circle>
						</svg>
						<div class="indicator__value">WebPack</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>