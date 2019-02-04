$(document).ready(function() {
	// console.log('Hello');

	var lostPasswordCheck = (function(){

			// Переменные модуля
			var _form = $('#setNewPasswordForm');
			var _errorBox = $('#errorBox');
			var _inputPassword = $('#password');
			var _noPasswordError = $('<div id="inputEmailEmpty" class="notification__error">Введите пароль</div>');

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

				if ( _inputPassword.val().trim() == '' ) {

					_noPasswordError.prependTo(_errorBox);
					event.preventDefault();
				} else {
					_form.find(_noPasswordError).remove();
					// console.log("Hello from _formValidate(), block else");
				}

				// Hide errors
				_inputPassword.on('focus', function(){
					_errorBox.find(_noPasswordError).remove();
				});

				_inputPassword.on('keydown', function(){
					_errorBox.find(_noPasswordError).remove();
				});
				// End  -  Hide errors

			}

			// Возвращаем публичные медоты, которые будут доступны снаружи
			return {
				init
			}
		
		}());

		// Запускаем модуль
	lostPasswordCheck.init();

});