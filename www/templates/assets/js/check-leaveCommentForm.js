$(document).ready(function() {
	// console.log('Hello');

	var leaveCommentCheck = (function(){

			// Переменные модуля
			var _form = $('#leaveCommentForm');
			var _errorBox = $('#errorBox');
			var _inputComment = $('#comment');
			var _noCommentError = $('<div id="inputCommentEmpty" class="notification__error">Введите комментарий</div>');

			// Метод инициализации (запуска) модуля
			var init = function(){
				_setUpListeners(); // Запускаем прослушку событий
			}

			// Приватные методы

			// Метод прослушки событий
			// В нем прослушиваем события на странице, например клики по кнопкам, и при срабатывании события запускаем нужный метод нашего модуля
			var _setUpListeners = function(){

				_form.on('submit', function(event){
					_formValidate(event);
				});
			}

			var _formValidate = function (event) {

				if ( _inputComment.val().trim() == '' ) {

					_noCommentError.prependTo(_errorBox);
					event.preventDefault();
				} else {
					_form.find(_noCommentError).remove();
				}

				// Hide errors
				_inputComment.on('focus', function(){
					_errorBox.find(_noCommentError).remove();
				});

				_inputComment.on('keydown', function(){
					_errorBox.find(_noCommentError).remove();
				});
				// End  -  Hide errors

			}

			// Возвращаем публичные медоты, которые будут доступны снаружи
			return {
				init
			}
		
		}());

		// Запускаем модуль
	leaveCommentCheck.init();

});