<?php
	$sid = session_id();
	$sql = mysql_query("SELECT SUM(jumlah*harga) as total,SUM(jumlah) as totaljumlah FROM orders_temp, produk 
			                WHERE id_session='$sid' AND orders_temp.id_produk=produk.id_produk");
			                
	while($r=mysql_fetch_array($sql)){

  if ($r['totaljumlah'] != ""){
    $total_rp    = format_rupiah($r['total']);

    echo "<span class='keranjang2'>($r[totaljumlah]) <span class='keranjang3'>item produk<br />
          <span class='border_cart'></span>
          Total: <span class='keranjang4'>Rp. $total_rp</span><br />

<a href='keranjang-belanja.html'><span class='keranjang'>lihat keranjang</a><br /><a href='selesai-belanja.html'><span class='keranjang'>selesai belanja</a><br />";
  }
  else{
    echo "<span class='keranjang2'>0 <span class='keranjang3'>item produk<br />
          <span class='border_cart'></span>
          Total: <span class='price'><span class='keranjang4'>Rp. 0</span>";
  }
  }
?>
