<?php
	// Функция выводит значения для полей ввода из массива POST, если он установлен. Иначе выводит значения полей из таблицы jobs в БД
	function dataFromPost($fieldName) {
		global $job;
		echo (@$_POST[$fieldName] != '') ? $_POST[$fieldName] : $job[$fieldName];
	}
?>

<div class="sticky-footer-content">
	<div class="container user-content pt-80 pb-120">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-1 work-experience-title">Редактировать - Место работы</div>

				<div class="work-experience-title-2">Отредактируйте информацию о месте работы</div>

				<?php require ROOT . 'templates/_parts/_errors.tpl'; ?>

				<form class="work-experience-form" 
				action="<?=HOST?>job-edit?id=<?=$job['id']?>" 
				method="POST" >
					<div class="work-experience-form__item">
						<label class="label">Период
							<input class="input-text" 
								type="text" 
								placeholder="Введите даты начала и окончания работы" 
								name="period"
								value="<?=dataFromPost('period')?>" />
						</label>
					</div>
					<div class="work-experience-form__item">
						<label class="label">Название должности
							<input class="input-text" 
								type="text" 
								placeholder="Введите название должности" 
								name="title"
								value="<?=dataFromPost('title')?>" />
						</label>
					</div>
					<div class="work-experience-form__item">
						<label class="label">Описание работы, должностные обязанности, достигнутые результаты
							<textarea class="textarea" 
								type="text" 
								placeholder="Напишите интересное краткое содержательное описание" 
								name="description"><?=dataFromPost('description')?></textarea>
						</label>
					</div>
					<input class="button button-save" 
						type="submit" 
						value="Сохранить" 
						name="editJob" />
				</form>
			</div>
		</div>
	</div>
</div>