<?php

// If you want a single bean instead of an array, use R::findOne()
// If no beans match the criteria, this function will return NULL. 
// $post  = R::findOne( 'posts', ' id = ? ', array($_GET['id']) );

// Запрос на данные о посте в блоге
$sqlPost = '
	SELECT posts.id, posts.title, posts.text, posts.author_id, posts.date_time, posts.post_img, posts.cat, posts.update_time, 
	users.name, users.surname, 
	categories.cat_title 
	FROM `posts`
	INNER JOIN categories
	ON posts.cat = categories.id 
	INNER JOIN users ON posts.author_id = users.id 
	WHERE posts.id = ' . $_GET['id'] . ' LIMIT 1';

// Функция getAll() позволяет выполнять SQL-запрос и возвращает многомерный массив данных
$post = R::getAll( $sqlPost );
$post = $post[0];

// Запрос на комментарии о посте
$sqlComments = 'SELECT 
			comments.user_id, comments.text, comments.date_time, 
			users.name, users.surname, users.avatar_small 
		FROM comments 
		INNER JOIN users ON comments.user_id = users.id
		WHERE comments.post_id = ' . $_GET['id'] ;

$comments = R::getAll( $sqlComments );

// Метод getCol() получает значения из таблицы только по 1 колонке
$postsId = R::getCol('SELECT id FROM posts');
foreach ($postsId as $index => $id) {
	if ( $id == $post['id'] ) {
		@$nextId = $postsId[$index + 1];
		@$prevId = $postsId[$index - 1];
		break;
	}
}


$title = $post['title'];

if ( isset($_POST['addComment']) ) {
	
	if ( trim($_POST['commentText']) == '' ) {
		$errors[] = ['title' => 'Введите текст комментария' ];
	}

	if ( empty($errors) ) {
		$comment = R::dispense('comments');
		$comment->postId = htmlentities($_GET['id']);
		$comment->userId = htmlentities($_SESSION['logged_user']['id']);
		$comment->text = htmlentities($_POST['commentText']);
		$comment->dateTime = R::isoDateTime();
		R::store($comment);
		$comments = R::getAll( $sqlComments );
	}

}

// Готовим контент для центральной части
ob_start();
include ROOT . 'templates/_parts/_header.tpl';
require ROOT . "templates/blog/blog-post.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . 'templates/_parts/_head.tpl';
include ROOT . 'templates/template.tpl';
include ROOT . 'templates/_parts/_footer.tpl';
include ROOT . 'templates/_parts/_foot.tpl';

?>