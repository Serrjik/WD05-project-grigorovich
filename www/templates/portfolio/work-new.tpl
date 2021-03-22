<div class="container user-content container-adaptive-vertical-padding">
	<div class="row">
		<div class="offset-lg-1 col-lg-10">
			<div class="title-1">Добавить работу</div>

			<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>

			<form class="works-add-form" 
				action="<?=HOST?>portfolio/work-new" 
				method="POST" 
				enctype="multipart/form-data" >
				<div class="works-add-form__item">
					<label class="label">Название
						<input class="input-text" 
							type="text" 
							placeholder="Введите название работы" 
							name="workTitle"
							value="<?=(trim(@$_POST['workTitle']) != '' ) ? $_POST['workTitle'] : '';?>" />
					</label>
				</div>
				<div class="works-add-form__item">
					<div class="load-file-title">Изображение </div>
					<div class="load-file-opis">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</div>
					<div class="load-file-fieldset">
						<input class="inputfile" 
							id="file-2" 
							type="file" 
							name="workImage" 
							data-multiple-caption="{count} файлов выбрано" 
							multiple="" />
						<label for="file-2">Выбрать файл</label><span>Файл не выбран</span>
					</div>
				</div>
				<div class="works-add-form__item">
					<label class="label">
						<span class="d-inline-block mb-10">Кратко о проекте</span>
						<textarea id="ckEditor" 
							class="textarea" 
							type="text" 
							placeholder="Введите описание работы" 
							name="workText" 
							><?=(trim(@$_POST['workText']) != '' ) ? $_POST['workText'] : '';?></textarea>
						<?php include_once ROOT . "templates/_parts/_ckEditorConnect.tpl" ?>
					</label>
				</div>
				<div class="works-add-form__item">
					<label class="label">
						<span class="d-inline-block mb-10">Результат</span>
						<textarea id="ckEditor1" 
							class="textarea" 
							type="text" 
							placeholder="Введите результат работы" 
							name="result" 
							><?=(trim(@$_POST['result']) != '' ) ? $_POST['result'] : '';?></textarea>
						<?php include_once ROOT . "templates/_parts/_ckEditorConnect.tpl" ?>
					</label>
				</div>
				<div class="works-add-form__item">
					<label class="label">
						<span class="d-inline-block mb-10">Технологии</span>
						<textarea id="ckEditor2" 
							class="textarea" 
							type="text" 
							placeholder="Введите технологии, использованные в работе" 
							name="technology" 
							><?=(trim(@$_POST['technology']) != '' ) ? $_POST['technology'] : '';?></textarea>
						<?php include_once ROOT . "templates/_parts/_ckEditorConnect.tpl" ?>
					</label>
				</div>
				<div class="row">
					<div class="col-md-6">
						<label class="label">Ссылка на проект
							<input class="input-text" 
								type="text" 
								placeholder="Введите ссылку" 
								name="linkToProject" 
								value="<?=(trim(@$_POST['linkToProject']) != '' ) ? $_POST['linkToProject'] : '';?>" />
						</label>
					</div>
					<div class="col-md-6">
						<label class="label">Код на github
							<input class="input-text" 
								type="text" 
								placeholder="Введите ссылку" 
								name="linkToGithub" 
								value="<?=(trim(@$_POST['linkToGithub']) != '' ) ? $_POST['linkToGithub'] : '';?>" />
						</label>
					</div>
				</div>
				<div class="works-add-form__buttons">
					<input class="button button-save works-add-form__button" 
						type="submit" 
						value="Сохранить" 
						name="workNew" />
					<a class="button" 
						href="<?=HOST?>portfolio">
						Отмена
					</a>
				</div>
			</form>
		</div>
	</div>
</div>