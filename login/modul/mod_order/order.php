<?php
session_start();
 if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
$aksi="modul/mod_order/aksi_order.php";
switch($_GET[act]){
  // Tampil Order
  default:
    echo "<form action=modul/mod_order/aksi_alldel.php method=POST>";
    echo "<h2>Order Masuk</h2>
          <table>
          <tr><th>#</th><th>No.Order</th><th>Nama Konsumen</th><th>Tgl. Order</th><th>Jam</th><th>Status</th><th>Aksi</th></tr>";

    $p      = new Paging;
    $batas  = 10;
    $posisi = $p->cariPosisi($batas);

    $tampil = mysql_query("SELECT * FROM orders ORDER BY id_orders DESC LIMIT $posisi,$batas");
    $no=0;
    while($r=mysql_fetch_array($tampil)){
      $tanggal=tgl_indo($r[tgl_order]);	  
      echo "<tr><td><input type=checkbox name=cek[] value=$r[id_orders] id=id$no></td>
	            <td >$r[id_orders]</td>
                <td>$r[nama_kustomer]</td>
				<td>$tanggal</td>
                <td>$r[jam_order]</td>
                <td>$r[status_order]</td>
		            <td><a href=?module=order&act=detailorder&id=$r[id_orders]><b>Baca</b></a> | 
		                <a href=$aksi?module=order&act=hapus&id=$r[id_orders]><b>Hapus</b></a></td></tr>";
      $no++;
    }
	           
    echo "<tr><td colspan=4 align=center>
<input type=radio name=pilih onClick='for (i=0;i<$no;i++){document.getElementById(\"id\"+i).checked=true;}'>Check All 
<input type=radio name=pilih onClick='for (i=0;i<$no;i++){document.getElementById(\"id\"+i).checked=false;}'>Uncheck All 

</td></tr>
<tr><td colspan=4 align=center><input type=submit class='tombol' value=Hapus></td>
</tr></table></form>";

    $jmldata = mysql_num_rows(mysql_query("SELECT * FROM orders"));
    $jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
    $linkHalaman = $p->navHalaman($_GET[halaman], $jmlhalaman);

    echo "<div class=paging>Hal: $linkHalaman</div><br>";
    break;
  
    
  case "detailorder":
    $edit = mysql_query("SELECT * FROM orders WHERE id_orders='$_GET[id]'");
    $r    = mysql_fetch_array($edit);
    $tanggal=tgl_indo($r[tgl_order]);

    $pilihan_status = array('Batal','Lunas/Terkirim');
    $pilihan_order = '';
    foreach ($pilihan_status as $status) {
	   $pilihan_order .= "<option value=$status";
	   if ($status == $r[status_order]) {
		    $pilihan_order .= " selected";
	   }
	   $pilihan_order .= ">$status</option>\r\n";
    }

    echo "<h2>Detail Order</h2>
          <form method=POST action=$aksi?module=order&act=update>
          <input type=hidden name=id value=$r[id_orders]>
          <table>
          <tr><td>No. Order</td>        <td> : $r[id_orders]</td></tr>
          <tr><td>Tgl. & Jam Order</td> <td> : $tanggal & $r[jam_order]</td></tr>
          <tr><td>Status Order      </td><td>: <select name=status_order>$pilihan_order</select> 
          <input type=submit value='Ubah Status'></td></tr>
          </table></form>";

  // tampilkan rincian produk yang di order
  $sql2=mysql_query("SELECT * FROM orders_detail, produk 
                     WHERE orders_detail.id_produk=produk.id_produk 
                     AND orders_detail.id_orders='$_GET[id]'");
  
  echo "<table border=0 width=500>
        <tr><th>Nama Produk</th><th>Jumlah</th><th>Harga Satuan</th><th>Sub Total</th></tr>";
  
  while($s=mysql_fetch_array($sql2)){
     // rumus untuk menghitung subtotal dan total	
    $subtotalberat = $s[berat] * $s[jumlah]; // total berat per item produk
	$totalberat  = $totalberat + $subtotalberat; // grand total berat all produk yang dibeli 		
    $subtotal    = $s[harga] * $s[jumlah];
    $total       = $total + $subtotal;
    $subtotal_rp = format_rupiah($subtotal);    
    $total_rp    = format_rupiah($total);    
    $harga       = format_rupiah($s[harga]);

    echo "<tr><td>$s[nama_produk]</td><td>$s[jumlah]</td><td>Rp. $harga</td><td>Rp. $subtotal_rp</td></tr>";
  }

  $ongkos=mysql_fetch_array(mysql_query("SELECT * FROM kota,orders WHERE orders.id_kota=kota.id_kota AND id_orders='$_GET[id]'"));
  $ongkoskirim1=$ongkos[ongkos_kirim];
  $ongkoskirim = $ongkoskirim1 * $totalberat;
  $grandtotal    = $total + $ongkoskirim; 

  $ongkoskirim_rp = format_rupiah($ongkoskirim);
  $grandtotal_rp  = format_rupiah($grandtotal); 
  $ongkoskirim1_rp   = format_rupiah($ongkoskirim1);    

echo "<tr><td colspan=3 align=right>Total : </td><td>Rp. <b>$total_rp</b></td></tr>
      <tr><td colspan=3 align=right>Ongkos Kirim Tujuan Kota Pembeli :</td><td>Rp. <b>$ongkoskirim1_rp /Kg</b></td></tr>
	  <tr><td colspan=3 align=right>Total Berat Barang: </td><td><b>$totalberat Kg</b></td></tr>
      <tr><td colspan=3 align=right>Ongkos Kirim : </td><td>Rp. <b>$ongkoskirim_rp</b></td></tr>      
      <tr><td colspan=3 align=right>Grand Total : </td><td>Rp. <b>$grandtotal_rp</b></td></tr>
      </table>";
	  
  // tampilkan data kustomer
  echo "<table border=0 width=500>
        <tr><th colspan=2>Data Kustomer</th></tr>
        <tr><td>Nama Pembeli</td><td> : $r[nama_kustomer]</td></tr>
        <tr><td>Alamat Pengiriman</td><td> : $r[alamat]</td></tr>
        <tr><td>No. Telpon/HP</td><td> : $r[telpon]</td></tr>
        <tr><td>Email</td><td> : $r[email]</td></tr>
        </table>"; 		  
    break;  
 }
}
?>
