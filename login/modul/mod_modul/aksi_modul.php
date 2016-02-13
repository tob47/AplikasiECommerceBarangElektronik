<?php
session_start();
include "../../../config/koneksi.php";

$module=$_GET[module];
$act=$_GET[act];

// Hapus modul
if ($module=='modul' AND $act=='hapus'){
  mysql_query("DELETE FROM modul WHERE id_modul='$_GET[id]'");
  header('location:../../media.php?module='.$module);
}

// Input modul
elseif ($module=='modul' AND $act=='input'){
  // Cari angka urutan terakhir
  $u=mysql_query("SELECT urutan FROM modul ORDER by urutan DESC");
  $d=mysql_fetch_array($u);
  $urutan=$d[urutan]+1;
  
  // Input data modul
  mysql_query("INSERT INTO modul(nama_modul,
                                 link,
                                 aktif,
                                 urutan) 
	                       VALUES('$_POST[nama_modul]',
                                '$_POST[link]',
                                '$_POST[aktif]',
                                '$urutan')");
  header('location:../../media.php?module='.$module);
}

// Update modul
elseif ($module=='modul' AND $act=='update'){
  mysql_query("UPDATE modul SET nama_modul = '$_POST[nama_modul]',
                                link       = '$_POST[link]',
                                aktif      = '$_POST[aktif]',
                                urutan     = '$_POST[urutan]'  
                          WHERE id_modul   = '$_POST[id]'");
  header('location:../../media.php?module='.$module);
}
?>
