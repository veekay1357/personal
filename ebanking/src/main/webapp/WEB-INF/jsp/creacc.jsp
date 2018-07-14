<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>OnlineBank_Create</title>
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
	<form id="form1" name="form1" method="post" action="UserAccount">
	  <table width="70%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr>
          <th colspan="3" bgcolor="#333333" scope="col"><font color="#FFFFFF">Create Bank Account</font></th>
        </tr>
        <tr>
          <td width="39%">&nbsp;</td>
          <td width="3%">&nbsp;</td>
          <td width="58%">&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right">Account Number </div></td>
          <td>:</td>
          <td><label>
          <%try{
          	Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","root");
			Statement st=con.createStatement();
			ResultSet ss=st.executeQuery("SELECT acc_no FROM b_acc WHERE acc_no=(SELECT MAX(acc_no) FROM b_acc)");
			while(ss.next()){
				String a_no=ss.getString("acc_no");
				int ac_no=Integer.parseInt(a_no);
				ac_no=ac_no+1;
							
          %>
           <input type="text" value="<%=ac_no %>" disabled="disabled"/>
            <input name="accno" type="hidden" id="accno"  value="<%=ac_no %>"/>
            <%} 
            
            }catch(Exception e)
            {
            	System.out.print(e);
            }%>
          </label></td>
        </tr>
        <tr>
          <td><div align="right">Account Holder Name </div></td>
          <td>:</td>
          <td><label>
            <input name="acname" type="text" id="acname"  required="required" />
          </label></td>
        </tr>
         <tr>
          <td><div align="right">Gender </div></td>
          <td>:</td>
          <td><label>
            <input name="gen" type="radio" value="Male"/>Male
             <input name="gen" type="radio" value="Female"/>Female
          </label></td>
        </tr>
          <tr>
          <td><div align="right">Date Of Birth </div></td>
          <td>:</td>
          <td><label>
            <input name="dob" type="date" id="dob"  required="required"/>
          </label></td>
        </tr>
          <tr>
          <td><div align="right">Date Of Joining </div></td>
          <td>:</td>
          <td><label>
            <input name="doj" type="date" id="doj"  required="required" />
          </label></td>
        </tr>
          <tr>
          <td><div align="right">Address </div></td>
          <td>:</td>
          <td><label>
            <textarea name="add" type="text" id="add"  required="required"></textarea>
          </label></td>
        </tr>
          <tr>
          <td><div align="right">Mobile No</div></td>
          <td>:</td>
          <td><label>
            <input name="mob" type="text" id="mob" maxlength="10" required="required" />
          </label></td>
        </tr>
          <tr>
          <td><div align="right">Email Id </div></td>
          <td>:</td>
          <td><label>
            <input name="email" type="text" id="email" placeholder="example@example.com" required="required" />
          </label></td>
        </tr>
        <tr>
          <td><div align="right">Account Type </div></td>
          <td>:</td>
          <td><select name="acctype">
		  <option value="CURRENT"> Current Account</option>
		  <option value="SAVING"> Saving Account</option>
		  <option value="STUDENT"> Student Account</option>
		  </select></td>
        </tr>
         <tr>
          <td><div align="right">Pin </div></td>
          <td>:</td>
          <td><label>
            <input name="pin" type="text" id="pin" maxlength="4" required="required"/>
          </label></td>
        </tr>
         <tr>
          <td><div align="right">Balance </div></td>
          <td>:</td>
          <td><label>
            <input name="bal" type="text" id="bal" required="required"/>
          </label></td>
        </tr>
        
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><label>
            <input type="submit" name="Submit" value="Create Account" />
          </label></td>
        </tr>
	</td>
  </tr></table>
  <tr style="height:30px;">
    <td colspan="3" style="background-color:#2175bc;">&nbsp;</td>
  </tr>
</table>
</body>

</html>
