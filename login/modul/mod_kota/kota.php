<?php
session_start();
 if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_kota/aksi_kota.php";
switch($_GET[act]){
  // Tampil Kategori
  default:
    echo "<h2>Kota Kabupaten</h2>
          <table width=650px><tr><td><span style='float : right;'><input style='width: 100px; height: 25px;' type=button value='Tambah Kota' onclick=\"window.location.href='?module=kota&act=tambahkota';\"></span></td></tr></table> 
          
          <table width=650px>
          <tr><th>no</th><th>nama kota</th><th>nama propinsi</th><th>aksi</th></tr>";

    $p      = new Paging;
    $batas  = 12;
    $posisi = $p->cariPosisi($batas);          
           
    $tampil=mysql_query("SELECT * FROM kota k, propinsi p
                         WHERE p.id_propinsi=k.id_propinsi ORDER BY nama_kota ASC LIMIT $posisi,$batas");
 
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
             <td align=left>$r[nama_kota]</td>
             <td align=left>$r[nama_propinsi]</td>
             <td align=center width=100px><a href=?module=kota&act=editkota&id=$r[id_kota]><img src='images/edit.gif' border=0 title=Edit></a> 
	               <a href=$aksi?module=kota&act=hapus&id=$r[id_kota]><img src='images/delete.gif' border=0 title=Hapus></a>
             </td></tr>";
      $no++;
    }
    echo "</table>";
    
    $jmldata = mysql_num_rows(mysql_query("SELECT * FROM kota"));
    $jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
    $linkHalaman = $p->navHalaman($_GET[halaman], $jmlhalaman);
    
    echo "<table width=650px><tr><td><div id=paging>$linkHalaman</div></td></tr></table>";
    break;
  
  // Form Tambah Kategori
  case "tambahkota":
    echo "<h2>Tambah Kota Kabupaten</h2>
          <form method=POST action='$aksi?module=kota&act=input'>
          <table>
          <tr><td>Nama Kota Kabupaten</td><td> : <input type=text name='nama_kota'></td></tr>
	        <tr><td>Nama Propinsi</td>  <td> : 
          <select name='propinsi'>
            <option value='' selected>- Pilih Propinsi -</option>";
            $tampil=mysql_query("SELECT * FROM propinsi ORDER BY nama_propinsi");
            while($r=mysql_fetch_array($tampil)){
                echo "<option value=$r[id_propinsi]>$r[nama_propinsi]</option>";
            }
    echo "</select></td></tr>
          <tr><td colspan=2><input type=submit name=submit value=Simpan>
                            <input type=button value=Batal onclick=self.history.back()></td></tr>
          </table></form>";
     break;
  
  // Form Edit Kategori  
  case "editkota":
    $edit=mysql_query("SELECT * FROM kota k, propinsi p
                         WHERE p.id_propinsi=k.id_propinsi
                         AND id_kota='$_GET[id]'");
    $r=mysql_fetch_array($edit);

    echo "<h2>Edit Kota Kabupaten</h2>
          <form method=POST action=$aksi?module=kota&act=update>
          <input type=hidden name=id value='$r[id_kota]'>
          <table>
          <tr><td>Nama Kota Kabupaten</td><td> : <input type=text name='nama_kota' value='$r[nama_kota]'></td></tr>
          <tr><td>Nama Propinsi</td><td> :
          <select name='propinsi'>
            <option value='' value=$r[id_propinsi]>$r[nama_propinsi]</option>";
            $tampil1=mysql_query("SELECT * FROM propinsi ORDER BY nama_propinsi");
            while($r2=mysql_fetch_array($tampil1)){
                echo "<option value=$r2[id_propinsi]>$r2[nama_propinsi]</option>";
            }
    echo "</select></td></tr>
          <tr><td colspan=2><input type=submit value=Update>
                            <input type=button value=Batal onclick=self.history.back()></td></tr>
          </table></form>";
    break;  
}
}
?>
