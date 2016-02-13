<?php
include "../config/koneksi.php";

if ($_SESSION[leveluser]=='admin'){
  $sql=mysql_query("select * from modul where aktif='Y' order by urutan");
}

if ($m=mysql_fetch_array($sql)){  
echo "<li><a href='?module=carabeli'><b>Edit Cara Pembelian</b></a></li>"; 
echo "<li><a href='?module=kategori'><b>Tambah Kategori Produk</b></a></li>"; 
echo "<li><a href='?module=produk'><b>Tambah Produk</b></a></li>"; 
echo "<li><a href='?module=order'><b>Lihat Order Masuk</b></a></li>"; 
echo "<li><a href='?module=hubungi'><b>Lihat Pesan Masuk</b></a></li>"; 
echo "<li><a href='?module=ongkoskirim'><b>Edit Ongkos Kirim</b></a></li>"; 
echo "<li><a href='?module=laporan'><b>Lihat Laporan Transaksi</b></a></li>";   
}
?>
