<?php
include "../config/koneksi.php";

if ($_SESSION[leveluser]=='admin'){
  $sql=mysql_query("select * from modul where aktif='Y' order by urutan");
}

if ($m=mysql_fetch_array($sql)){  
    echo "<li><a href='?module=password'><b>Ganti Password</b></a></li>";
	
    //echo "<li><a href='?module=modul'><b>Edit Modul Admin</b></a></li>";
  
}
?>
