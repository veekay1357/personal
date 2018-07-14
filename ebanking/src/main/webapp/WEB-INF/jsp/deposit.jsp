<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" %>


<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>OnlineBank_Deposit</title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />

</head>

<body>
<table width="900" height="500" border="1" align="center" cellpadding="0" cellspacing="0" style="font-weight:normal; background-color:#FFFFFF">
    <tr style="height:30px;">
    <td colspan="3" style="background-color:#2175bc;">&nbsp;</td>
  </tr>
  <tr>
<td width="160" >
<div id="ddblueblockmenu">
  <div class="menutitle">Account Operations</div>
  <ul>
  <% String uname=(String)session.getAttribute("uname"); %>
    <li><a href="wele.jsp">Welcome,&nbsp;<%=uname%></a></li>
    <li><a href="creacc.jsp">Create Account</a></li>
	<li><a href="deposit.jsp">Deposit</a></li>
    <li><a href="withdraw.jsp">Withdraw</a></li>
    <li><a href="bal.jsp">Balance</a></li>
   <li><a href="userepe.jsp">Report</a></li>
	<li><a href="logout.jsp">LogOut</a></li>
  </ul>
  <div class="menutitle">&nbsp;</div>
</div>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>	</td>
    <td colspan="2" style="padding:20px;">
	<div class="box1">
	<marquee><h2><font color="#FF0000">Welcome To Online Bank.</font></h2></marquee>
	</div>
	<br/>
	<form id="form1" name="form1" method="post" action="doDeposit.jsp">
	  <table width="70%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr>
          <th colspan="3" bgcolor="#333333" scope="col"><font color="#FFFFFF">To Deposit </font></th>
        </tr>
        <tr>
          <td width="39%">&nbsp;</td>
          <td width="3%">&nbsp;</td>
          <td width="58%">&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right">Account Holder Name </div></td>
          <td>:</td>
          <td><label>
            <input name="uname" type="text" id="uname"  />
          </label></td>
        </tr>
        <tr>
          <td><div align="right">Account Number </div></td>
          <td>:</td>
          <td><label>
           <input name="accNo" type="text" maxlenth="8" id="name"/>
		 </label></td></tr>
		 <tr>
          <td><div align="right">Date </div></td>
          <td>:</td>
          <td><label>
            <input name="date" type="date" id="date"  />
          </label></td>
        </tr>
        </tr>
        <tr>
          <td><div align="right">Deposit Amount </div></td>
          <td>:</td>
          <td><input name="Amount" type="text" id="Amount" size="10" />  
            Rs</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><label>
            <input name="Submit" type="submit" value="Deposit Amount" />
          </label></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>

      </table>
      </form>
	</td>
  </tr>
  <tr style="height:30px;">
    <td colspan="3" style="background-color:#2175bc;">&nbsp;</td>
  </tr>
</table>
</body>

</html>
>