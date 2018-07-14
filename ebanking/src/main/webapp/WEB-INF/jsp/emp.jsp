<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OnlineBank_EmpMan</title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
</style>
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
  <%
  String uname=(String)session.getAttribute("uname");
  %>
    <li><a href="welad.jsp">Welcome,&nbsp;<%=uname %></a></li>
       <li><a href="emp.jsp">Employee Management</a></li>
	<li><a href="repad.jsp">Report</a></li>
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
	<marquee><h2><font color="#FF0000">Welcome To Online Bank</font></h2></marquee>
	</div>
	<br/>
	<form id="form1" name="form1" method="post" action="EmployeeAccount">
	  <table width="70%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr>
          <th colspan="3" bgcolor="#333333" scope="col"><font color="#FFFFFF">Register Employee</font></th>
        </tr>
        <tr>
          <td width="39%">&nbsp;</td>
          <td width="3%">&nbsp;</td>
          <td width="58%">&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right">Employee Id </div></td>
          <td>:</td>
          <td><label>
            <%try{
          	Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","root");
			Statement st=con.createStatement();
			ResultSet ss=st.executeQuery("SELECT empid FROM emp_id WHERE empid=(SELECT MAX(empid) FROM emp_id)");
			while(ss.next()){
				String empid=ss.getString("empid");
				int emp=Integer.parseInt(empid);
				emp=emp+1;
							
          %>
           <input type="text" value="<%=emp %>" disabled="disabled"/>
            <input name="empid" type="hidden" id="empid"  value="<%=emp %>"/>
            <%} 
            
            }catch(Exception e)
            {
            	System.out.print(e);
            }%>
          </label></td>
        </tr>
        <tr>
          <td><div align="right">Employee Name </div></td>
          <td>:</td>
          <td><label>
            <input type="text" name="empnam" id="empnam"  required="required"/>
          </label></td>
        </tr>
        <tr>
          <td><div align="right">Moblie No </div></td>
          <td>:</td>
          <td><label>
            <input type="text" name="emplmob" id="emplmob" minlength="10" maxlength="10"  required="required"/>
          </label></td>
        </tr>
        <tr>
          <td><div align="right">Email </div></td>
          <td>:</td>
          <td><label>
            <input type="text" name="emplem" id="emplem" placeholder="example@example.com"  required="required"/>
          </label></td>
        </tr>
        <tr>
          <td><div align="right">Username </div></td>
          <td>:</td>
          <td><label>
            <input type="text" name="emplnus" id="emplnus"  required="required"/>
          </label></td>
        </tr>
        <tr>
          <td><div align="right">Password </div></td>
          <td>:</td>
          <td><label>
            <input type="password" name="emplpas" id="emplpas"  required="required"/>
          </label></td>
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
           <input type="submit" name="Submit" value="Register Employee" />
          </label></td>
	</td>
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
  
