<div class="container user-content pt-80 pb-120">

	<div class="title-1 post-add__title">Создать товар</div>

	<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>

	<form class="post-add-form" 
		action="<?=HOST?>shop/new" 
		method="POST" 
		enctype="multipart/form-data" >
		
		<div class="post-add-form__name">
			<label class="label">Название
				<input class="input-text" 
					type="text" 
					value="<?=(trim(@$_POST['postTitle']) != '' ) ? $_POST['postTitle'] : '';?>" 
					name="title" 
					placeholder="Введите название" />
			</label>
		</div>

		<div class="row mt-30">
			<div class="col">
				<div class="post-add-form__name">
					<label class="label">Цена
						<input class="input-text" 
							type="text" 
							value="<?=(trim(@$_POST['postTitle']) != '' ) ? $_POST['postTitle'] : '';?>" 
							name="price" 
							placeholder="" />
					</label>
				</div>
			</div>
			<div class="col">
				<div class="post-add-form__name">
					<label class="label">Старая цена
						<input class="input-text" 
							type="text" 
							value="<?=(trim(@$_POST['postTitle']) != '' ) ? $_POST['postTitle'] : '';?>" 
							name="priceOld" 
							placeholder="" />
					</label>
				</div>
			</div>
		</div>

		<div class="post-add-form__file">
			<div class="load-file-title">Изображение </div>
			<div class="load-file-opis">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</div>
			<div class="load-file-fieldset">
				<input class="inputfile" 
					id="file-2" 
					type="file" 
					name="itemImg" 
					data-multiple-caption="{count} файлов выбрано" 
					multiple="" />
				<label for="file-2">Выбрать файл</label>
				<span>Файл не выбран</span>
			</div>
		</div>

		<div class="post-add-form__textarea">
			<label class="label">Содержание
				<textarea id="ckEditor" 
					class="textarea" 
					type="text" 
					placeholder="Введите описание" 
					name="itemDesc"><?=(trim(@$_POST['postText']) != '' ) ? $_POST['postText'] : '';?></textarea>
					<?php include_once ROOT . "templates/_parts/_ckEditorConnect.tpl" ?>
			</label>
		</div>

		<div class="post-add-form-button">
			<input class="button button-save" 
				type="submit" 
				value="Сохранить" 
				name="itemNew" />
			<div class="post-add-form-button__cancel">
				<a class="button" href="<?=HOST?>shop">Отмена</a>
			</div>
		</div>

	</form>

</div>