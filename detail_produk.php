<?php
// Modul detail produk
if ($_GET['module']=='detailproduk'){
  // Tampilkan detail produk berdasarkan produk yang dipilih
	$detail=mysql_query("SELECT * FROM produk,kategori    
                      WHERE kategori.id_kategori=produk.id_kategori 
                      AND id_produk='$_GET[id]'");
	$d   = mysql_fetch_array($detail);
  $harga = format_rupiah($d['harga']);
  
   //cek stok untuk tampilkan tombol beli dan habis
    $stok=$d['stok'];
    $tombolbeli="<a class='addtocart' href=\"aksi.php?module=keranjang&act=tambah&id=$d[id_produk]\">beli</a>";
    $tombolhabis="";
      if ($stok!= "0"){
      $tombol=$tombolbeli;
      }else{
      $tombol=$tombolhabis;
      }
	echo "<h4 class='heading colr'>Kategori: <a href='kategori-$d[id_kategori]-$d[kategori_seo].html'>$d[nama_kategori]</a></h4></div>";

	echo"<div class='feat_prod_box_details'>";
 	if ($d[gambar]!=''){
		echo "<div class='prod_img3'><a href='foto_produk/$d[gambar]' rel='lightbox'><img src='foto_produk/$d[gambar]' width=180  alt='klik untuk memperbesar gambar' title='klik untuk memperbesar gambar' border='0' /></a>
                <br/>
                <a href='foto_produk/$d[gambar]' rel='lightbox'><img src='images/zoom.png' alt='klik untuk memperbesar gambar' title='klik untuk memperbesar gambar' border='0' /></a>
                </div>";}
	            echo"<div class='details_big_box'>
            <div class='product_title_big'>$d[nama_produk]</div>
            <div class='details'>$d[deskripsi]</div><br />
                    <div class='table6'>HARGA: <span class='table7'>Rp. $harga</span></div>
                    <div class='table6'>STOK:<span class='table7'> $d[stok] item</span></div><br />
                    <a href='aksi.php?module=keranjang&act=tambah&id=$d[id_produk]' class='more'><img src='images/beli.gif' alt='' title='' border='0' /></a>
                    <div class='clear'></div>
                    </div>
                    
                    <div class='box_bottom'></div>
                </div> <div class='clear'></div>
            </div><br /> ";                          
// Produk Lainnya (random)          
  $sql=mysql_query("SELECT * FROM produk ORDER BY rand() LIMIT 4");
      
  echo "<h4 class='heading colr'>Produk Lainnya</h4</div>";
      
  while ($r=mysql_fetch_array($sql)){
    $harga = format_rupiah($r[harga]);
  //cek stok untuk tampilkan tombol beli dan habis
    $stok=$r['stok'];
    $tombolbeli="<a class='prod_cart_beli' href=\"aksi.php?module=keranjang&act=tambah&id=$r[id_produk]\">beli</a>";
    $tombolhabis="<span class='prod_cart_habis'>habis</span>";
      if ($stok!= "0"){
      $tombol=$tombolbeli;
      }else{
      $tombol=$tombolhabis;
      }
 echo "<div class='prod_box'>
          <div class='center_prod_box'>            
             <div class='product_title'><a href='produk-$r[id_produk]-$r[produk_seo].html'>$r[nama_produk]</a></div>
             <div class='product_img'>
               <a href='produk-$r[id_produk]-$r[produk_seo].html'>
               <img  src='foto_produk/$r[gambar]' border='0' height=125 width=129></a>
             </div>
             <div class='prod_price'><span class='price'>Rp. $harga <br />(stok: $r[stok])</span></div>                        
          </div>
          
          <div class='prod_details_tab'>
             <a href='aksi.php?module=keranjang&act=tambah&id=$r[id_produk]' class='prod_cart'>BELI</a>            
             <a href='produk-$r[id_produk]-$r[produk_seo].html' class='prod_details'>DETAIL</a>            
          </div> 
          </div>";

}
}
?>
