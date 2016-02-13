<?php

session_start();
include "../../../config/koneksi.php";

$module=$_GET[module];
$act=$_GET[act];

if ($module=='order' AND $act=='hapus'){
  mysql_query("DELETE FROM orders WHERE id_orders='$_GET[id]'"); 
  header('location:../../media.php?module='.$module);
 }
elseif ($module=='order' AND $act=='update'){
   // Update stok barang saat transaksi sukses (Lunas)
   if ($_POST[status_order]=='Lunas/Terkirim'){ 
    
      // Update untuk mengurangi stok 
      mysql_query("UPDATE produk,orders_detail SET produk.stok=produk.stok-orders_detail.jumlah WHERE produk.id_produk=orders_detail.id_produk AND orders_detail.id_orders='$_POST[id]'");
	  
	  // Update untuk menambahkan produk yang dibeli (best seller = produk yang paling laris)
      mysql_query("UPDATE produk,orders_detail SET produk.dibeli=produk.dibeli+orders_detail.jumlah WHERE produk.id_produk=orders_detail.id_produk AND orders_detail.id_orders='$_POST[id]'");

      // Update status order
      mysql_query("UPDATE orders SET status_order='$_POST[status_order]' where id_orders='$_POST[id]'");
      header('location:../../media.php?module='.$module);
      }	  
	  elseif($_POST[status_order]=='Batal'){
	  mysql_query("UPDATE produk,orders_detail SET produk.stok=produk.stok+orders_detail.jumlah WHERE produk.id_produk=orders_detail.id_produk AND orders_detail.id_orders='$_POST[id]'"); //menambah stok yang tidak jadi dibeli
	  
	  // Update untuk mengurangkan produk yang tidak jadi dibeli ( tidak jd best seller)
      mysql_query("UPDATE produk,orders_detail SET produk.dibeli=produk.dibeli-orders_detail.jumlah WHERE produk.id_produk=orders_detail.id_produk AND orders_detail.id_orders='$_POST[id]'");

      // Update status order
      mysql_query("UPDATE orders SET status_order='$_POST[status_order]' where id_orders='$_POST[id]'");	  
	  header('location:../../media.php?module='.$module);
	  }
 else{
     mysql_query("UPDATE orders SET status_order='$_POST[status_order]' where id_orders='$_POST[id]'");
     header('location:../../media.php?module='.$module);
     }
}
?>


