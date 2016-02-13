<?php 
  error_reporting(0);
  session_start();	
  include "config/koneksi.php";
  include "config/fungsi_indotgl.php";
  include "config/class_paging.php";
  include "config/fungsi_combobox.php";
  include "config/library.php";
  include "config/fungsi_autolink.php";
  include "config/fungsi_rupiah.php";
  include "hapus_orderfiktif.php";?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title><?php include "dina_titel.php"; ?></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="index, follow">
<meta name="description" content="<?php include "dina_meta1.php"; ?>">
<meta name="keywords" content="<?php include "dina_meta2.php"; ?>">
<meta http-equiv="Copyright" content="Dadang">
<meta name="author" content="Dadang">
<meta http-equiv="imagetoolbar" content="no">
<meta name="language" content="Indonesia">
<meta name="revisit-after" content="7">
<meta name="webcrawlers" content="all">
<meta name="rating" content="general">
<meta name="spiders" content="all">


<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">

<!--// Stylesheet //-->
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="css/contentslider.css" rel="stylesheet" type="text/css" />
<link href="css/default.advanced.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ad-gallery.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.fancybox-1.3.1.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/slider.css" rel="stylesheet" type="text/css" />
<!--// Javascript //-->
<script type="text/javascript" src="config/jquery.js"></script>
<script type="text/javascript" src="js/clearbox.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.min14.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/anythingslider.js"></script>
<script type="text/javascript" src="js/jquery.anythingslider.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.2.js"></script>
<script type="text/javascript" src="js/jquery.fancybox-1.3.1.js"></script>
<script type="text/javascript" src="js/contentslider.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/jquery.ad-gallery.js"></script>
<script type="text/javascript" src="js/lightbox.js"></script>
<script type="text/javascript" src="js/thumbgallery.js"></script>
<script type="text/javascript" src="js/eurofurence_500-eurofurence_700.font_9bc22cbd.js"></script>
<script type="text/javascript" src="js/cufon.js"></script>

<script type="text/javascript" src="js/newsticker.js"></script>

<!--[if lte IE 7]>
<script type="text/javascript" src="js/jquery.dropdown.js"></script>
<![endif]-->


<script type="text/javascript" src="js/easy.js"></script>
<script type="text/javascript">
	$(document).ready(function(){		
		$.easy.tooltip();	
});
</script>





<meta charset="UTF-8">

<style type="text/css">
<!--
.style1 {color: #FF6600}
-->
</style>
</head>

<body>
<a name="top"></a>
<div id="wrapper_sec">
	<div id="head">
	  <div class="logo">
        	<a href="index.html"><img src="images/logo.png" alt="" /></a>
      </div>
        <div class="rightnavi">
            <br><br><br><br>
          <div class="clear">
          <ul><SCRIPT language=JavaScript src="almanak.js"></SCRIPT> 
          <span class="style1">I</span> <SCRIPT language=JavaScript>var d = new Date();
var h = d.getHours();
if (h < 11) { document.write('Selamat pagi, pengunjung...'); }
else { if (h < 15) { document.write('Selamat siang, pengunjung...'); }
else { if (h < 19) { document.write('Selamat sore, pengunjung...'); }
else { if (h <= 23) { document.write('Selamat malam, pengunjung...'); }
}}}</SCRIPT>    </ul> </div>
      </div>
        <div class="clear"></div>
        <div class="navigation">
          <ul id="nav" class="dropdown dropdown-linear dropdown-columnar">
			<li><b><a href='index.php'>BERANDA</a></b></li>
			<li><b><a href='profil-kami.html'>PROFIL</a></b></li>
            <li><b><a href='semua-produk.html'>SEMUA PRODUK</a></b></li>
			<li><b><a href='keranjang-belanja.html'>KERANJANG BELANJA</a></b>
				<ul>
				<li class='clear'><b><a href='keranjang-belanja.html'>LIHAT KERANJANG</a></b></li>
				<li class='clear'><b><a href='selesai-belanja.html'>SELESAI BELANJA</a></b></li>
				</ul>
            </li>
			<li><b><a href='cara-pembelian.html'>CARA PEMBELIAN</a></b></li>
			<li><b><a href='hubungi-kami.html'>HUBUNGI KAMI</a></b></li>
          </ul>
  </div></div>
    <div class="clear"></div>
    <div id="crumb">
    	<ul class="left">
        	<li><p>anda berada di:</p></li>
            </ul>
			<ul class="left2">
              <?php include "breadcrumb.php";?>
      
        </ul>
        <ul class="search right"><form method="POST" action="hasil-pencarian.html">
            	<li><input name="kata" type="text" value="cari produk"  class="bar" /></li>
                <li><input type="submit" class="go" value="cari" /></li></form>
      </ul>
  </div>
    <div class="clear"></div>

    <div id="content_sec">
    	<div class="col1">
        
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/spacer.gif" width="1" height="20" /></td>
              </tr>
              <tr>
                <td><span class="center_content2"><?php include "tengah.php";?></td>
              </tr>
            </table>
            <div class="clear"></div>
      </div>
    	<div class="col2">
       	  <div class="mycart">
            	<div class="small_heading">
            		<h5>Keranjang Belanja</h5>
                </div>
           
                <table width="81%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="27%">
                    <?php require_once "item.php";?></td>
                    <td width="73%"><img src="images/beli.png" width="50" height="45" /></td>
                  </tr>
                </table>
       	  </div>
            <div class="myaccount">
            	<div class="small_heading">
            		<h5>Kategori Produk </h5>
                </div>
                <ul>
                
                  <?php
            $kategori=mysql_query("select nama_kategori, kategori.id_kategori, kategori_seo,  
                                  count(produk.id_produk) as jml 
                                  from kategori left join produk 
                                  on produk.id_kategori=kategori.id_kategori 
                                  group by nama_kategori");
            $no=1;
            while($k=mysql_fetch_array($kategori)){
              if(($no % 2)==0){
                echo "<li><a href='kategori-$k[id_kategori]-$k[kategori_seo].html'> $k[nama_kategori] ($k[jml])</a></li>";
              }
              else{
                echo "<li><a href='kategori-$k[id_kategori]-$k[kategori_seo].html'> $k[nama_kategori] ($k[jml])</a></li>";              
              }
              $no++;
            }
            ?></li>
              
                </ul>
            </div>
		  
		  <div class="poll">
            	<div class="small_heading">
            		<h5>Bank Pembayaran </h5>
                </div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><div align="center"><span class="border_box">
                      <span class='bank'></a></div>
						 <div class='bank'>
							 <img src='foto_banner/mandiri.gif' border='0' >
							 </a>
						 </div>
						<div class='bank'><span class='bank'>No. Rek : 123 456 789
						<div class='bank'><span class='bank'>an. Dadang Supriatna</span></div><br>
						<div class='bank'>
							 <img src='foto_banner/bni.gif' border='0' >
							 </a>
						 </div>
						<div class='bank'><span class='bank'>No. Rek : 987 654 321
						<div class='bank'><span class='bank'>an. Dadang Supriatna</span></div>
                    </span></div>
				</td>
                  </tr>
                </table>
          </div>
		  		  
    	</div>
    	<div class="clear"></div>
    </div>
    <div class="clear"></div>
    <div id="footer">
        <div class="aboutus">
        	<h5>Tentang Kami</h5>
        	<p>
            	Buana Elektronik adalah toko elektronik online, yang menyediakan segala kebutuhan barang-barang elektronik anda. Buana elektronik ingin memberikan kemudahan kepada para calon pembeli, cara santai, mudah dan hemat dalam berbelanja barang elektronik berkualias dengan harga yang terjangkau.</p>
            <a href="profil-kami.html" class="simplebtn">selanjutnya</a>
        </div>
        <div class="contactus">
        	<h5>Kontak Kami </h5>
            <ul>
            	<li class="tel"><span class="bold">Telp:</span> 085 223 123 456 </li>
                <li class="email"><span class="bold">Email:</span> <a href="mailto:dadang_supriatna@yahoo.com">dadang_supriatna@yahoo.com</a></li>
                
            </ul>
        </div>
        <div class="clear"></div>
        <div class="copyright_network">
        	<p>Copyright ©2013 by: Dadang Supriatna </p>
			<ul class="network"><li>
            	               
                <li><a href="login/index.php" >LOGIN</a></li>
            </ul>
        </div>
        <div class="clear"></div>
	</div>
</div>
</body>
</html>

