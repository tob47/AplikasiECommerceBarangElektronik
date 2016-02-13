<?php
session_start();
include "../../../config/koneksi.php";
include "../../../config/fungsi_thumb.php";

$module=$_GET[module];
$act=$_GET[act];

// Update profil
if ($module=='profil' AND $act=='update'){
  $lokasi_file = $_FILES['fupload']['tmp_name'];
  $nama_file   = $_FILES['fupload']['name'];

  // Apabila ada gambar yang diupload
  if (!empty($lokasi_file)){
    UploadBanner($nama_file);
    move_uploaded_file($lokasi_file,"images/$nama_file");
    mysql_query("UPDATE modul SET static_content = '$_POST[isi]',
                                  gambar         = '$nama_file'    
                            WHERE id_modul       = '$_POST[id]'");
  }
  else{
    mysql_query("UPDATE modul SET static_content = '$_POST[isi]'
                            WHERE id_modul       = '$_POST[id]'");
  }
  header('location:../../media.php?module='.$module);
}
?>
