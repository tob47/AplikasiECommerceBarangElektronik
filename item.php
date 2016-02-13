<?php
	$sid = session_id();
	$sql = mysql_query("SELECT SUM(jumlah*harga) as total,SUM(jumlah) as totaljumlah FROM orders_temp, produk 
			                WHERE id_session='$sid' AND orders_temp.id_produk=produk.id_produk");
			                
	while($r=mysql_fetch_array($sql)){

  if ($r['totaljumlah'] != ""){
     $total_rp    = format_rupiah($total);

    echo "<span class='keranjangitem'>&nbsp; &nbsp; $r[totaljumlah]<span class='keranjang3'>&nbsp; &nbsp; item produk<br />
          <span class='border_cart'></span>
        

<a href='keranjang-belanja.html'><span class='keranjang'>lihat keranjang</a><br /><a href='selesai-belanja.html'><span class='keranjang'>selesai belanja</a><br />";
  }
  else{
    echo "<span class='keranjang2'>0 <span class='keranjang3'>item produk<br />
          <span class='border_cart'></span>
        ";
  }
  }
?>
