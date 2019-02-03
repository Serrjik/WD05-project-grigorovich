<?php

// Готовим контент для центральной части
ob_start();
require ROOT . "templates/login/form-lost-password.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'templates/_parts/_head.tpl';
require ROOT . "templates/login/login-page.tpl";
include ROOT . 'templates/_parts/_foot.tpl';

?>
<script src="<?=HOST?>templates/assets/js/check-lost-password-form.js"></script>