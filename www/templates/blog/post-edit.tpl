<div class="sticky-footer-content">
	<div class="container container-adaptive-vertical-padding user-content">
		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<div class="title-1 post-add__title">Редактировать пост</div>

				<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>

				<form class="post-add-form" 
					action="<?=HOST?>blog/post-edit?id=<?=$post['id']?>" 
					method="POST" 
					enctype="multipart/form-data">
					<div class="post-add-form__name">
						<label class="label">Название
							<input class="input-text" type="text" value="<?=$post['title']?>" name="postTitle" placeholder="Введите название" />
						</label>
					</div>

					<div class="post-add-form__textarea">
						<label class="label">Категория
							<select name="postCat">
								<?php foreach ($cats as $cat): ?>
									<option 
										value="<?=$cat['id']?>" 
										<?=($post['cat'] == $cat['id']) ? "selected" : ""; ?> 
									>
										<?=$cat['cat_title']?>
									</option>
								<?php endforeach ?>
							</select>
						</label>

					</div>

					<div class="post-add-form__file">
						<div class="load-file-title">Изображение </div>
						<div class="load-file-opis">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</div>
						<div class="load-file-fieldset">
							<input class="inputfile" id="file-2" type="file" name="postImg" data-multiple-caption="{count} файлов выбрано" multiple="" />
							<label for="file-2">Выбрать файл</label><span>Файл не выбран</span>
						</div>

						<?php if ( $post['post_img_small'] != "" ): ?>
							<div class="load-file-wrap">
								<div class="load-file-wrap-img">
									<img 
										class="load-file-wrap-img__image" 
										src="<?=HOST?>usercontent/blog/<?=$post['post_img_small']?>" 
										alt="<?=$post->title?>" />
								</div>
								<div class="load-file-wrap__button">
									<a class="button button-delete button-small" href="#!">Удалить</a>
								</div>
							</div>
						<?php endif ?>

					</div>
					<div class="post-add-form__textarea">
						<label class="label">Содержание
							<textarea id="ckEditor" class="textarea" type="text" placeholder="Введите описание" name="postText"><?=$post['text']?></textarea>
							<?php include_once ROOT . "templates/_parts/_ckEditorConnect.tpl" ?>
						</label>
					</div>
					<div class="post-add-form-button flex-wrap align-items-start">
						<input class="button button-save mb-20 mb-sm-0 mr-20" type="submit" value="Сохранить" name="postUpdate" />
						<div class="post-add-form-button__cancel">
							<a class="button" href="<?=HOST?>blog">Отмена</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>