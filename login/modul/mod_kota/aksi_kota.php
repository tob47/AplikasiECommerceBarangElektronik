<?php
session_start();
include "../../../config/koneksi.php";
//include "../../../config/fungsi_seo.php";

$module=$_GET[module];
$act=$_GET[act];

// Hapus Kategori
if ($module=='kota' AND $act=='hapus'){
  mysql_query("DELETE FROM kota WHERE id_kota='$_GET[id]'");
  header('location:../../media.php?module='.$module);
}

// Input kota
elseif ($module=='kota' AND $act=='input'){
//  $kota_seo = seo_title($_POST['nama_kota']);
  mysql_query("INSERT INTO kota(nama_kota, id_propinsi) VALUES('$_POST[nama_kota]', '$_POST[propinsi]')");
  header('location:../../media.php?module='.$module);
}

// Update kota
elseif ($module=='kota' AND $act=='update'){
//  $kota_seo = seo_title($_POST['nama_kota']);
  mysql_query("UPDATE kota SET nama_kota = '$_POST[nama_kota]', id_propinsi = '$_POST[propinsi]' WHERE id_kota = '$_POST[id]'");
  header('location:../../media.php?module='.$module);
}
?>
