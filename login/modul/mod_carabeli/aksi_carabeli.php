<?php
include "../../../config/koneksi.php";

$module=$_GET[module];
$act=$_GET[act];

// Update cara pembelian
if ($module=='carabeli' AND $act=='update'){
  mysql_query("UPDATE modul SET static_content = '$_POST[isi]'
                            WHERE id_modul     = '$_POST[id]'");
  header('location:../../media.php?module='.$module);
}
?>
