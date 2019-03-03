$('.inputfile').change(function() {
	var input = $('input[name=postImg]')[0];
	// Идёт проверка поддержки API для работы с файлами и наличие файловых данных
	if (input.files && input.files[0]) {
		// Проверяем соответствуют ли данные картинке
		if ( input.files[0].type.match('image.*')) {
			// Далее используем FileReader() для чтения данных из файла и сохранения
			// их в JavaScript переменную
			var reader = new FileReader();
			// Когда данные будут загружены (событие onload),
			// мы присвоим их атрибуту src элемента предпросмотра
			reader.onload = function(e) {
				$('#image_preview').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
			$('#file-caption').text(input.files[0]['name']);
			$('#imgPreviewBlock').show();

			// $('<a id="delPreview" class="button button-delete mt-10">' + 'Удалить превью' + '</a>').insertAfter('#image_preview');
		} else console.log('is not image mime type');
	} else console.log('not isset files data or files API not supordet');

	$('body').on('click', '#delPreview', function(event) {
		$('#imgPreviewBlock').hide();
		$('.inputfile').val('');
		$('#image_preview').attr('src', '');
		$('#file-caption').text("Файл не выбран");
		event.preventDefault();
	});
});