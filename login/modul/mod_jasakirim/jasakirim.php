<?php
session_start();
 if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{

?>

<script language="javascript">
function validasi(form){
  if (form.nama_jasa.value == ""){
    alert("Anda belum mengisikan nama Jasa Pengiriman.");
    form.nama_jasa.focus();
    return (false);
  }
   return (true);
}
</script>

<?

$aksi="modul/mod_jasakirim/aksi_jasakirim.php";
$module=$_GET['module'];

switch($_GET['act']){
  // Tampil Kategori
  default:
    echo "<h2>Jasa Pengiriman Barang</h2>
          <table width=650px><tr><td><span style='float : right;'><input style='width: 150px; height: 25px;' type=button type=button value='Tambah Jasa Pengiriman' onclick=\"window.location.href='?module=$module&act=tambahjasa';\"></span></td></tr></table>";    
    // Cek jikalau data dalam database kosong
    // Jika kosong
    $tampil2 = mysql_query("SELECT * FROM jasa_kirim");
    $r2=mysql_fetch_array($tampil2);
    if($r2['id_jasa']==0){
		echo"";
		
    }else{
            // Jika tidak kosong
            
              echo"<table width=650px>
              <tr><th>no</th><th>nama jasa pengiriman</th><th>Deskripsi</th><th>aksi</th></tr>"; 
        $tampil=mysql_query("SELECT * FROM jasa_kirim ORDER BY id_jasa DESC");
        $no=1;
        while ($r=mysql_fetch_array($tampil)){
            
            // Kolom Warna
            if(($no%2)==0){
            $warna="ganjil";
            }else{
            $warna="genap";
            }
            // Kolom Warna
            
           echo "<tr class='$warna'>
                 <td align=center width=30px>$no</td>
                 <td>$r[nama_jasa]</td>
                 <td>$r[deskripsi]</td>
                 <td align=center width=100px><a href=?module=$module&act=editjasa&id=$r[id_jasa]><img src='images/edit.gif' border=0 title=Edit></a> 
    	               <a href=$aksi?module=$module&act=hapus&id=$r[id_jasa]&namafile=$r[gambar]><img src='images/delete.gif' border=0 title=Hapus></a>
                 </td></tr>";
          $no++;
        }
        echo "</table>";
    }
    break;
  
  // Form Tambah Perusahaan Pengiriman
  case "tambahjasa":
    echo "<h2>Tambah Perusahaan Pengiriman Barang</h2>
          <form method=POST action='$aksi?module=$module&act=input' enctype='multipart/form-data' onSubmit=\"return validasi(this)\">
          <table width=650px>
          <tr><td width=150px>Nama Jasa Pengiriman</td><td width=500px> : <input type=text name='nama_jasa'></td></tr>
          <tr><td>Deskripsi </td><td> : <input type=text name='deskripsi'></td></tr>
          <tr><td colspan=2><input type=submit name=submit value=Simpan>
                            <input type=button value=Batal onclick=self.history.back()></td></tr>
          </table></form>";
     break;
  
  // Form Edit Perusahaan Pengiriman  
  case "editjasa":
    $edit=mysql_query("SELECT * FROM jasa_kirim WHERE id_jasa='$_GET[id]'");
    $r=mysql_fetch_array($edit);

    echo "<h2>Edit Jasa Pengiriman Barang</h2>
          <form method=POST action=$aksi?module=$module&act=update enctype='multipart/form-data' onSubmit=\"return validasi(this)\">
          <input type=hidden name=id value='$r[id_jasa]'>
          <table width=650px>
          <tr><td>Nama Jasa Pengiriman</td><td> : <input type=text name='nama_jasa' value='$r[nama_jasa]'></td></tr>
          <tr><td>Deskripsi</td><td> : <input type=text name='deskripsi' value='$r[deskripsi]'></td></tr>
          <tr><td colspan=2>*) Apabila gambar tidak diubah, dikosongkan saja.</td></tr>
          <tr><td colspan=2><input type=submit value=Update>
                            <input type=button value=Batal onclick=self.history.back()></td></tr>
          </table></form>";
    break;  
}

}
?>
