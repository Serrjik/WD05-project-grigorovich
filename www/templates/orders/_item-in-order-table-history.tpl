<tr>
	<td scope="row">
		<a href="<?=HOST?>shop/item?id=<?=$item->id?>" >
			<?=$item->title?>
		</a>
	</td>
	<td>
		<?=$item->count?>
	</td>
	<td>
		<?=price_format($item->price);?> рублей
	</td>
</tr>