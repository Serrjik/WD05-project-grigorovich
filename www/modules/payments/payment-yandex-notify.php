<?php

// echo"<pre>";
// print_r($_POST);
// echo"</pre>";

$text = json_encode($_POST);

file_put_contents(ROOT . 'yandex-history.php', $text . PHP_EOL, FILE_APPEND);

/*notification_type&operation_id&amount&currency&datetime&sender&codepro&notification_secret&label

p2p-incoming&1234567&300.00&643&2011-07-01T09:00:00.000+04:00&41001XXXXXXXX&false&01234567890ABCDEF01234567890&

p2p-incoming&1234567&300.00&643&2011-07-01T09:00:00.000+04:00&41001XXXXXXXX&false&01234567890ABCDEF01234567890&YM.label.12345*/

$string = $_POST['notification_type'] . '&' . 
	$_POST['operation_id'] . '&' . 
	$_POST['amount'] . '&' . 
	$_POST['currency'] . '&' . 
	$_POST['datetime'] . '&' . 
	$_POST['sender'] . '&' . 
	$_POST['codepro'] . '&' . 
	YANDEX_SECRET . '&' . 
	$_POST['label'];

$hash = sha1($string);

$myHash = 'My hash: ' . $hash;
$yandexHash = 'Yandex hash: ' . $_POST['sha1_hash'];

file_put_contents(ROOT . 'yandex-history.php', $myHash . PHP_EOL, $yandexHash . PHP_EOL, FILE_APPEND);

?>