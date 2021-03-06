$(document).ready(function() {
	console.log('Hello');

	var lostPasswordCheck = (function(){

			// Переменные модуля
			var _form = $('#lost-password-form');
			var _errorBox = $('#errorBox');
			var _inputEmail = $('#email');
			var _inputEmailEmpty = $('#inputEmailEmpty');
			var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
			var _noEmailError = $('<div id="inputEmailEmpty" class="notification__error">Введите email</div>');
			var _invalidEmailError = $('<div id="invalidEmailError" class="notification__error">Неверный формат email</div>');

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

				if ( _inputEmail.val().trim() == '' ) {

					// _inputEmailEmpty.fadeIn(1000);
					_noEmailError.prependTo(_errorBox);
					event.preventDefault();
				} else if ( !(pattern.test(_inputEmail.val().trim())) ) {
					_invalidEmailError.prependTo(_errorBox);
					event.preventDefault();
				} else {
					// _inputEmailEmpty.fadeOut(1000);
					_form.find(_noEmailError).remove();
					_form.find(_invalidEmailError).remove();
					console.log("Hello from _formValidate(), block else");
				}

				// Hide errors
				_inputEmail.on('focus', function(){
					_errorBox.find(_noEmailError).remove();
					_errorBox.find(_invalidEmailError).remove();
				});

				_inputEmail.on('keydown', function(){
					_errorBox.find(_noEmailError).remove();
					_errorBox.find(_invalidEmailError).remove();
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