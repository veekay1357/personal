<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OnlineBank_Bal</title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
</style>
</head>

<body>
<table width="900" height="500" border="1" align="center" cellpadding="0" cellspacing="0" style="font-weight:normal; background-color:#FFFFFF">
    <tr style="height:30px;">
    <td colspan="3" style="background-color:#2175bc;">&nbsp;</td>
  </tr>
   <%
  String uname=(String)session.getAttribute("uname");
  %>
  <tr>
<td width="160" >
<div id="ddblueblockmenu">
  <div class="menutitle">Account Operations</div>
  <ul>
    <li><a href="welu.jsp">Welcome,&nbsp;<%=uname%></a></li>
    <li><a href="account.jsp">Account</a></li>
    <li><a href="balu.jsp">Balance</a></li>
	<li><a href="transfer.jsp">Transfer</a></li>
	<li><a href="loan.jsp">Loan </a></li>
	<li><a href="userepu.jsp">Report</a></li>
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
	  <table width="70%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr><td>
 <%try {
      	
    			Class.forName("com.mysql.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","root");
    			Statement st=con.createStatement();
    			System.out.println("connection success");
    			ResultSet rs=st.executeQuery("select acc_no,name,bal from b_acc where name='"+uname+"'");
    			while(rs.next()){
    				String acc=rs.getString("acc_no");
    				String name=rs.getString("name");
    				double bal=rs.getDouble("bal");%>

    		        	 <table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
                             <tr>
                                <th colspan="3" bgcolor="#333333" scope="col"><font color="#FFFFFF">Current Balance  </font></th>
                             </tr>
                             <tr>
          <td><div align="right"><strong> Name </strong></div></td>
          <td><div align="right"><strong>:</strong></div></td>
          <td><%=uname%></td>
        </tr>
        <tr>
          <td><div align="right"><strong>Account No. </strong></div></td>
          <td><div align="right"><strong>:</strong></div></td>
          <td>&nbsp;<%=acc%></td>
        </tr>
        <tr>
          <td><div align="right"><strong>Current Balance </strong></div></td>
          <td><div align="right"><strong>:</strong></div></td>
          <td>&nbsp;<font color="#FF0000">Rs.<%=bal%> </font></td>
        </tr>
                        </table>
                   
               <%}} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}%></td></tr>
	  </table>
  <tr style="height:30px;">
    <td colspan="3" style="background-color:#2175bc;">&nbsp;</td>
  </tr>
</table>
</body>

</html>
