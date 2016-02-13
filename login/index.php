<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script language="javascript">
function validasi(form){
  if (form.username.value == ""){
    alert("Anda belum mengisikan Username.");
    form.username.focus();
    return (false);
  }
     
  if (form.password.value == ""){
    alert("Anda belum mengisikan Password.");
    form.password.focus();
    return (false);
  }
  return (true);
}
</script>

<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="description"  content=""/>
<meta name="keywords" content=""/>
<meta name="robots" content="ALL,FOLLOW"/>
<meta name="Author" content="AIT"/>
<meta http-equiv="imagetoolbar" content="no"/>
<title>.::Halaman Administrator::.</title>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
<link rel="stylesheet" href="css/reset.css" type="text/css"/>
<link rel="stylesheet" href="css/screen.css" type="text/css"/>


<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/cufon.js"></script>
<script type="text/javascript" src="js/Geometr231_Hv_BT_400.font.js"></script>
<script type="text/javascript" src="js/script.js"></script>

</head>

<body class="no-side">

<div class="login-box">
<div class="login-border">
<div class="login-style">
	<div class="login-header">
		<div class="logo clear">
			<div align="right"><span class="title"><img src="images/logo.png" alt="" width="185" height="80" class="picture" /></span></div>
		</div>
	</div>
<form name="login" action="cek_login.php" method="POST" onSubmit="return validasi(this)">
		
		<div class="login-inside">
			<div class="login-data">
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><div align="center">
                    <table cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="25">Username</td>
                        <td> :
                          <input type="text" name="username"  class="text" /></td>
                      </tr>
                      <tr>
                        <td height="26">Password</td>
                        <td> :
                          <input type="password" class="text" name="password" /></td>
                      </tr>
                      
                      <tr>
                        <td colspan="2"><div align="right">
                          <input name="submit"  class="submit" type="submit" value="LOGIN" />
                        </div></td>
                      </tr>
                    </table>
                  </div></td>
                </tr>
              </table>
			</div>
		</div>
	  </form>

</div>
</div>
</div>

</body>

<meta http-equiv="content-type" content="text/html;charset=UTF-8">
</html>
