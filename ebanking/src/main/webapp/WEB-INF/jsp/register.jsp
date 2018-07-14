<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" %>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>OnlineBank_Register</title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
function conpas()
{
	var pass=document.getElementById("password").value;
	var cpass=document.getElementById("cpassword").value;
	
	if(pass!=cpass)
		{
		 alert('Wrong Confirm Password');
		 return false;
		}
	}

</script>
<body>

<table width="900" height="500" border="1" align="center" cellpadding="0" cellspacing="0" style="font-weight:normal; background-color:#FFFFFF">
    <tr style="height:30px;">
    <td colspan="3" style="background-color:#2175bc;">&nbsp;</td>
  </tr>
  <tr>
	</td>
    <td colspan="2"><table width="98%" border="0" align="center" cellpadding="1" cellspacing="0">
      <tr>
        <th colspan="2" scope="col">
		<div class="box1">
	<marquee><h2><font color="#FF0000">Welcome To Online Bank</font></h2></marquee>
	</div>
	<br/>
	<br/>
		</th>
      </tr>
      <tr>
	  
        <th colspan="2" scope="col">
        <form id="form1" name="form1" method="post" action="UserEBanking" onsubmit="return validate()">
          <table width="80%" border="0" align="center" cellpadding="2" cellspacing="2" style="border:#000000 solid 2px;padding:5px;">
            <tr>
              <th colspan="3" bgcolor="#000000" scope="col" style="height:20px;"><font color="#FFFFFF">Customer Registration For new Account</font></th>
              </tr>
            <tr>
              <td width="28%" rowspan="12"><div align="center"><img src="image/log.png" width="48" height="48" /></div></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
             <td width="24%"><div align="left">Username:</div></td>
              <td width="48%"><label>
                <div align="left">
                  <input name="username" type="text"  id="username"  required="required" />
                  </div>
              </label></td>
            </tr>
            <tr>
              <td><div align="left">Password:</div></td>
              <td><div align="left">
                <input name="password" type="password"  id="password"  required="required" />
              </div></td>
            </tr>
             <tr>
              <td><div align="left">Confirm Password:</div></td>
              <td><div align="left">
                <input name="cpassword" type="password"  id="cpassword"  required="required" />
              </div></td>
            </tr>
            <tr>
              <td><div align="left">Account_No:</div></td>
              <td><div align="left">
                <input name="account" type="text"  id="account" maxlength="8" required="required"/>
              </div></td>
            </tr>
            <tr>
              <td><div align="left">Pin:</div></td>
              <td><div align="left">
                <input name="pin" type="password" id="pin"  maxlength="4" required="required" />
              </div></td>
            </tr>
    
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><label>
                <div align="right">
                  <input type="reset" name="Submit2" value="Reset" />
                  </div>
              </label></td>
              <td colspan="2"><label>
                
                    <div align="left">
                      <input name="Submit" type="submit"  value="Create Account"  />
                    </div>
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
        <td width="50%">&nbsp;</td>
        <td width="50%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr style="height:30px;">
    <td colspan="3" style="background-color:#2175bc;">&nbsp;</td>
  </tr>
</table>
</body>

</html>
