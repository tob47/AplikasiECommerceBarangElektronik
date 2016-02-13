<?php
require_once "koneksi.php";
$q=$_POST["kota"];
$tampil=mysql_query("SELECT k.id_kota, j.id_jasa, j.nama_jasa jasa, o.biaya biaya, o.id_ongkir FROM 
                              kota k, ongkos_kirim o, jasa_kirim j 
                              WHERE k.id_kota=o.id_kota
                              AND j.id_jasa=o.id_jasa                             
                              AND k.id_kota='".$q."'");
$jml=mysql_num_rows($tampil);
if($jml > 0){
    echo"<select name='jasa' id='jasa'>
     <option value='0' selected>- Pilih Jasa Pengiriman -</option>";
     while($r=mysql_fetch_array($tampil)){
         echo "<option value=$r[id_ongkir]>$r[jasa] ($r[biaya])</option>";
     }
     echo "</select>";
}else{
    echo "<select name='jasa'>
     <option value=0 selected>- Jasa Pengiriman tidak ada -</option
     </select>";
}
/*
$tampil=mysql_query("SELECT * FROM kota WHERE id_perusahaan='$_GET[perusahaan]' ORDER BY nama_kota");
$jml=mysql_num_rows($tampil);
if($jml > 0){
    echo"<select name='kota'>
     <option value='0' selected>- Pilih Kota -</option>";
     while($r=mysql_fetch_array($tampil)){
         echo "<option value=$r[id_kota]>$r[nama_kota]</option>";
     }
     echo "</select>";
}else{
    echo "<select name='kota'>
     <option value=0 selected>- Data Wilayah Tidak Ada, Pilih Yang Lain -</option
     </select>";
}*/
?>
