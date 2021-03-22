<div class="work-experience-post">
	<div class="work-experience-post-wrap">
		<div class="work-experience-post-wrap__date mb-20 mb-sm-0">
			<?=$job->period?>
		</div>
		<div class="work-experience-post-button">
			<a class="button button-edit mb-20 mb-md-0" href="<?=HOST?>job-edit?id=<?=$job->id?>" >Редактировать</a>
			<a class="button button-delete" href="<?=HOST?>job-delete?id=<?=$job->id?>" >Удалить</a>
		</div>
	</div>
	<div class="work-experience-post__title">
		<?=$job->title?>
	</div>
	<div class="work-experience-post__message mb-20 mb-sm-0">
		<?=$job->description?>
	</div>
</div>