<?php
require_once "koneksi.php";
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
}

?>