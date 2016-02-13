<?php
// Modul profil
if ($_GET['module']=='profilkami'){
  // Data profil mengacu pada id_modul=43
	$profil = mysql_query("SELECT * FROM modul WHERE id_modul='43'");
	$r      = mysql_fetch_array($profil);

  echo "<h4 class='heading colr'>Profil Kami</h4>
    	  <div class='prod_box_bigx'>
             <div class='img_profil'>
                 <img src='foto_banner/$r[gambar]' height=155 width=200 border='0' />
            </div>
          <div class='profil'>
              <div>$r[static_content]</div>
			  <div class='bottom_prod_box_big4'></div>
          </div>    
          </div>
          </div>";                             
}

?>
