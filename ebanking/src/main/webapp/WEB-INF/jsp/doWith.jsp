<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" %>


<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>OnlineBank_doWithdraw</title>
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
	<form id="form1" name="form1" method="post" action="">
	  <table width="70%" border="0" align="center" cellpadding="2" cellspacing="2">
        
        <tr>
          <td width="39%">&nbsp;</td>
          <td width="3%">&nbsp;</td>
          <td width="58%">&nbsp;</td>
        </tr>
        <tr><td><center>
        <%try{
        	String nam=request.getParameter("uname");
            String accno = request.getParameter("accNo");
            double amt=Double.parseDouble( request.getParameter("Amount"));
            String date=request.getParameter("date");
            
            Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","root");
			Statement st=con.createStatement();
			System.out.println("connection success");
			ResultSet rs=st.executeQuery("select acc_no,name,bal from b_acc");
			int f=0;
			while(rs.next()){
				String acc=rs.getString("acc_no");
				String name=rs.getString("name");
				double bal=rs.getDouble("bal");
				double balanc=bal-amt;
				if((acc.equals(accno))&&(name.equals(nam)))
		         {
		        	 if(amt<=bal)
		        	 {
		        	 int s=st.executeUpdate("insert into trans(acc,credit,debit,bal,date) values ('"+accno+"',0,'"+amt+"','"+balanc+"','"+date+"')");
		        	 int y=st.executeUpdate("update b_acc set bal='"+balanc+"' where acc_no='"+accno+"'");
		        	 ResultSet r=st.executeQuery("select bal from b_acc where acc_no='"+accno+"'");
		        	 while(r.next()){
		        		 double balance=r.getDouble("bal");
		        	 %><center><div class="box2">
	                   Rs.<%=amt %> is successfull withdrawed from the account <%=accno %><br>
	                   Current Account Balance :Rs.<%=balance %>
	                  </div></center>
		        	<%}
		        	 }else{%>
		        	<p align="left" style="line-height:18px; padding:10px; font-weight:normal"><font color="#FF0000">Sorry!!!Not enough balance to Withdraw<br></font></p>
		        	 Current Account Balance :Rs.<%=bal %>
		       <%  }
		        	 }
		    
		         else
		         { f=1; }%>
		        	
		 <%}
			if(f==1){
				%>
				<font color="#FF0000">Invalid Account Number.<br/>
				<%
			}
        }
           catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}%>
        
        
        
        
        </center></td>
        </tr>
        
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
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