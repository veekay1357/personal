<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OnlineBank_Index</title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
window.location.hash="no-back-button";
window.location.hash="again-no-back-button";
window.onhshchange=function()
{
	window.location.hash="no-back-button";
	}
</script>

</head>

<body background-image:url("image/ab.jsp")> 
<table width="900" height="500" border="1" align="center" cellpadding="0" cellspacing="0" style="font-weight:normal; background-color:#FFFFFF">
    <tr style="height:30px;">
   
    
    <td colspan="3" style="background-color:#2175bc;">&nbsp;</td>
  </tr>
  <tr>

   <td colspan="2"><table width="98%" border="0" align="center" cellpadding="1" cellspacing="0">
      <tr>
        <th colspan="2" scope="col"><div class="box1">
          <marquee>
            <h2><font color="#FF0000">Welcome To Online Bank</font></h2>
            </marquee>
        </div></th>
        </tr>
         <center><img src="image\ab.jpg"></center>
      </tr>
         <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      
      <tr>
        <th width="50%" scope="col"><form id="form1" name="form1" method="post" action="doLogin">
          <table width="100%" border="0" align="center" cellpadding="2" cellspacing="2" style="border:#000000 solid 2px; padding:5px;">
            <tr>
              <th colspan="3" bgcolor="#000000" scope="col"><font color="#FFFFFF">Login</font></th>
              </tr>
            <tr>
              <td width="28%" rowspan="3"><div align="center"><img src="image/log.png" width="48" height="48" /></div></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="24%">Username:</td>
              <td width="48%"><label>
                <input name="username" type="text" id="username" required="required" />
              </label></td>
            </tr>
            <tr>
              <td>Password:</td>
              <td><label>
                <input name="password" type="password" id="password" required="required" />
              </label></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td colspan="2"><label>
                
                    <div align="center">
                      <input name="Submit" type="submit" onclick="doLogin" value="Submit" />
                    </div>
                  </label></td>
              </tr>
            <tr>
              <td colspan="3">Want to Create a New Account? <a href="register.jsp">Click Here</a> </td>
              </tr>
              <tr>
              <td width="24%"></td>
              <td width="48%"><label>
              <select name="op"><option >User</option><option >Employee</option><option >Admin</option></select>
              </label></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </table>
                </form>        </th>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr style="height:30px;">
    <td colspan="3" style="background-color:#2175bc;">&nbsp;</td>
  </tr>
</table>
</body>

</html>