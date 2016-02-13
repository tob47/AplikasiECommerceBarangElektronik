<?php
    echo "<h2>Ganti Password</h2>
          <form method=POST action=modul/mod_password/aksi_password.php>
          <table>
          <tr><td>Masukkan Password Lama</td><td> : <input type=password name='pass_lama'></td></tr>
          <tr><td>Masukkan Password Baru</td><td> : <input type=password name='pass_baru'></td></tr>
          <tr><td>Masukkan Lagi Password Baru</td><td> : <input type=password name='pass_ulangi'></td></tr>
          <tr><td colspan=2><input type=submit class='tombol' value=Proses>
                            <input type=button class='tombol' value=Batalkan onclick=self.history.back()></td></tr>
          </table></form>";
?>
