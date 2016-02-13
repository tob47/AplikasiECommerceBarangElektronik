<script language="javascript">

$(document).ready(function() {
	$('#kota').change(function() { 
		var category = $(this).val();
		$.ajax({
			type: 'POST',
			url: '../config/jasa.php',
			data: 'kota=' + category, // Untuk data di MySQL dengan menggunakan kata kunci tsb
			dataType: 'html',
			beforeSend: function() {
				$('#jasa').html('<tr><td colspan=2><img src=./images/ajax_load.gif> Loading ....</td></tr>');	
			},
			success: function(response) {
				$('#jasa').html(response);
			}
		});
    });
});
</script>
