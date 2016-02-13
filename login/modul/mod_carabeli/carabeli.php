<?php
session_start();
 if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_carabeli/aksi_carabeli.php";
switch($_GET[act]){
  // Tampil Cara Pembelian
  default:
    $sql  = mysql_query("SELECT * FROM modul WHERE id_modul='45'");
    $r    = mysql_fetch_array($sql);

    echo "<h2>Cara Pembelian</h2>
          <form method=POST action=$aksi?module=carabeli&act=update>
          <input type=hidden name=id value=$r[id_modul]>
          <table>
         <tr><td><textarea name='isi' style='width: 600px; height: 350px;'>$r[static_content]</textarea></td></tr>
         <tr><td><input type=submit class=tombol value=Update></td></tr>
         </form></table>";
    break;  
}
}
?>
