<?php
session_start();
if(!session_is_registered("namauser")){
  echo"<meta http-equiv=\"refresh\" content=\"0; URL=../../index.php\" />";
}else{

include "../../../config/koneksi.php";

$module=$_GET['module'];
$act=$_GET['act'];
$folderimg="../../../images/logo_jasa/"; // Tempat upload file gambar

// Hapus Perusahaan Pengiriman
if ($module==$module AND $act=='hapus'){
      mysql_query("DELETE FROM jasa_kirim WHERE id_jasa='$_GET[id]'");           
      
  header('location:../../media.php?module='.$module);
}

// Input Perusahaan Pengiriman
elseif ($module=="$module" AND $act=='input'){
  
  mysql_query("INSERT INTO jasa_kirim(nama_jasa) 
                            VALUES('$_POST[nama_jasa]')");      
 
  header('location:../../media.php?module='.$module);
}

// Update Perusahaan Pengiriman
elseif ($module=="$module" AND $act=='update'){
  mysql_query("UPDATE jasa_kirim SET nama_jasa = '$_POST[nama_jasa]' WHERE id_jasa = '$_POST[id]'");
  
  header('location:../../media.php?module='.$module);
}

}
?>
