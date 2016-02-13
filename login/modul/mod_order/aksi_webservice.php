<?php
require("../WebService/lib/nusoap.php");
?>
<?php
$url="http://localhost/webservicebank/webservice.php";
if ($_POST[proses]) {
	extract($_POST);
	if (empty($no_rek_pembeli)) {
		echo "<html><head><title>Verifikasi Pembayaran</title></head></body>";
		echo "<h2>Isi dulu No Rekening Pembeli</h2>";
		echo "Tekan Back pada Toolbars";
		echo "</body></html>";
	}
	else {
		
		$client=new soapclient($url);
		
		$result=$client->call("cekPembayaran",array("no_rek_pengirim"=>$_POST['txt_no_rek_pembeli']));
		
		$err=$client->getError();
		if($err){
			echo "<p><b>ERROR ! ".$client->getError()."</p></b>";
		}
		else{
			if($result==null){
				echo "<p><b>Terdapat kesalahan !</b></p>";
			}
			else{
				echo "<tr><td>Nama Pembeli</td><td> : ".$result[0]['nama_pengirim']."</td></tr>";
				echo "<tr><td>Jumlah</td><td> : ".$result[0]['jumlah']."</td></tr>";
			}
		}
	}
}
?>