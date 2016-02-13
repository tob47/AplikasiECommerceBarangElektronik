<?php
session_start();
include "../../../config/koneksi.php";


$cek=$_POST[cek];
$jumlah=count($cek);
    
  for($i=0;$i<$jumlah;$i++){
  mysql_query("DELETE FROM orders WHERE id_orders='$cek[$i]'");
  }
  header('location:../../media.php?module=order');
?>