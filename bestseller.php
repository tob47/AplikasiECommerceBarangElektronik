<?php
// Produk Best Seller
      $best=mysql_query("SELECT * FROM produk ORDER BY dibeli DESC LIMIT 1");
      while($a=mysql_fetch_array($best)){
        $harga = format_rupiah($a['harga']);
		    echo "<div class='product_title'><a href='produk-$a[id_produk]-$a[produk_seo].html'>$a[nama_produk]</a></div>
         <div class='product_img'>
             <a href='produk-$a[id_produk]-$a[produk_seo].html'>
                <img width= 130 src='foto_produk/small_$a[gambar]' border='0' height='110'>
             </a>
         </div>
         <div class='prod_price'><span class='price'>Rp. $harga</span></div>";
      }

?>
