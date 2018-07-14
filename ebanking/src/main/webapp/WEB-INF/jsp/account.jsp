<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*"%>

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>OnlineBank_User</title>
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
	<form id="form1" name="form1" method="get" >
	  <table width="70%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr>
          <th colspan="3" bgcolor="#333333" scope="col"><font color="#FFFFFF">Account Details</font></th>
        </tr>
        <tr>
          <td width="39%">&nbsp;</td>
          <td width="3%">&nbsp;</td>
          <td width="58%">&nbsp;</td>
        </tr>
 
   <%try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","root");
			Statement st=con.createStatement();
	       
	        ResultSet rs=st.executeQuery("select * from b_acc where name='"+uname+"'");%>
  
	        <form>
	        <table>
	        <%
	        while(rs.next())
			{
		String accno=rs.getString("acc_no");
		String name=rs.getString("name");
		String gen=rs.getString("gender");
		String dob=rs.getString("dob");
		String doj=rs.getString("doj");
		String add=rs.getString("address");
		String mob=rs.getString("mob");
		String email=rs.getString("email");
		String type=rs.getString("type");	%>
	 <center>   
		<tr><td><strong>Account Number :</strong></td><td><input type='text' name='accno' value=<%=accno %>><br><br></td></tr>
		<tr><td><strong>Name    :</strong></td><td><input type='textarea' name='name' value=<%=name %>><br><br></td></tr>
		<tr><td><strong>Gender:</strong></td><td><input type='text' name='gen' value=<%=gen %>><br><br></td></tr>
		<tr><td><strong>DateOfBirth:</strong></td><td><input type='text' name='dob' value=<%=dob %>><br><br></td></tr>
		<tr><td><strong>DateOfJoin:</strong></td><td><input type='text' name='doj' value=<%=doj %>><br><br></td></tr>
		<tr><td><strong>Address   :</strong></td><td><input type='text' name='add' value=<%=add %>><br><br></td></tr>
		<tr><td><strong>Mobile   :</strong></td><td><input type='text' name='mob' value=<%=mob %>><br><br></td></tr>
		<tr><td><strong>Email   :</strong></td><td><input type='text' name='email' value=<%=email %>><br><br></td></tr>
		<tr><td><Strong>Type   :</Strong></td><td><input type='text' name='type' value=<%=type %>><br><br></td></tr>
		<%}%>  
	       </center>   
	        </table>
	        </form>
	        
		
		
	<%  }
	catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}%>
  
   </tr></table>
  <tr style="height:30px;">
    <td colspan="3" style="background-color:#2175bc;">&nbsp;</td>
  </tr>
</table>
</body>

</html>
