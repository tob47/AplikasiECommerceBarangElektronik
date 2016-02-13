<?php
// setting timer, lama data adalah 3 hari
$lama = 3;
// hapus order baru yang tidak dilunasi selama 3 hari
$query = "DELETE FROM orders WHERE DATEDIFF(CURDATE(), tgl_order) > $lama AND status_order='Baru'";
$hasil = mysql_query($query);
?>