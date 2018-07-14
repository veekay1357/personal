<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*"%>

<
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>OnlineBank_transfer</title>
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
    <li><a href="account.jsp">Account</a></li>
    <li><a href="balu.jsp">Balance</a></li>
	<li><a href="transfer.jsp">Transfer</a></li>
	<li><a href="loan.jsp">Loan </a></li>
	<li><a href="userepu.jsp">Report</a></li>
	<li><a href="logout.jsp">LogOut</a></li>
  </ul>
  <div class="menutitle">&nbsp;</div>
</div>
 </td>
    <td colspan="2" style="padding:20px;line-height:20px;">
	<div class="box1">
	<marquee><h2><font color="#FF0000">Online Bank.</font></h2></marquee>
	</div>
	<br/>
	<br/>
	<form id="form1" name="form1" method="post" action="doTrans.jsp">
	  <table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr>
          <th colspan="3" bgcolor="#333333" scope="col"><font color="#FFFFFF">To Transfer </font></th>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right"><strong>Account Number</strong> </div></td>
          <td>:</td>
          <td><label>
<%try{
          	Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","root");
			Statement st=con.createStatement();
			ResultSet ss=st.executeQuery("SELECT account FROM user WHERE uname='"+uname+"'");
			while(ss.next()){
				String acc=ss.getString("account");
				  %>
		           <input type="text" value="<%=acc %>" disabled="disabled"/>
		            <input name="accno" type="hidden" id="accno"  value="<%=acc %>"/>
		            <%} 
		            
		            }catch(Exception e)
		            {
		            	System.out.print(e);
		            }%>
		          </label></td>
		        </tr>
        <tr>
          <td><div align="right"><strong>Send To Account No. </strong></div></td>
          <td>:</td>
          <td><label>
            <input name="DaccNo" type="text" maxlength="8" id="accNo"/>
          </label></td>
        </tr>
        <tr>
          <td><div align="right"><strong>Date</strong> </div></td>
          <td>:</td>
          <td><label>
            <input name="date" type="date" id="date"  />
          </label></td>
        </tr>
        <tr>
          <td><div align="right"><strong>Amount</strong></div></td>
          <td>:</td>
          <td><label>
            <input name="Amount" type="text" id="Amount" size="10" />
          Rs</label></td>
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
          <input type="submit" name="Submit" value="Transfer Amount  " />
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
