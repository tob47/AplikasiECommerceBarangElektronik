
<form method="POST" action=<?php $_SERVER['PHP_SELF']; ?>>
<table>
<tr><td>Lupa Password ?</td></tr>
<tr><td>Email Anda : <input name="email" type="text"> 
<input type="submit" name="proses" value="Proses"></td></tr>
</table>
</form>

<?php
include "config/koneksi.php";
if($_POST[proses]){

  $sql    = "SELECT password1 FROM users WHERE email='$_POST[email]'";
  $hasil  = mysql_query($sql);
  $jumlah = mysql_num_rows($hasil);

  if ($jumlah==1){
    $data=mysql_fetch_array($hasil);
    $kepada = "$_POST[email]"; //alamat email user
    $judul = "Password Anda";
    $dari = "From: email@namadomain.com \r\n"; 
    $dari .= "Content-type: text/html \r\n";
    $pesan = "Password Anda untuk login ke website kami <br>";
    $pesan .= "Password Anda : <b>$data[password1]</b>";

    mail($kepada,$judul,$pesan,$dari);
    echo "Password telah terkirim ke email Anda";
  }
else{
    echo "Password tidak bisa dikirimkan ke email Anda";
  }
}
?>
