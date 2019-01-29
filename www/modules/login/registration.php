<?php

// Готовим контент для центральной части
ob_start();
require ROOT . "templates/login/form-registration.tpl";
$content = ob_get_contents();
ob_end_clean();

require ROOT . "templates/login/login-page.tpl";

?>