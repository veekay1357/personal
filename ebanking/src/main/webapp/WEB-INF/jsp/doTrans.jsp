<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" %>


<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>OnlineBank_doTrans</title>
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
	<form id="form1" name="form1" method="post">
	  <table width="70%" border="0" align="center" cellpadding="2" cellspacing="2">
        
        <tr>
          <td width="39%">&nbsp;</td>
          <td width="3%">&nbsp;</td>
          <td width="58%">&nbsp;</td>
        </tr>
        <tr><td><center>
        <%try{
        	
        	String acc=request.getParameter("accno");
            String dacc = request.getParameter("DaccNo");
            double amt=Double.parseDouble( request.getParameter("Amount"));
            String date=request.getParameter("date");
           // System.out.println(acc+dacc+amt+date);
            Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","root");
			Statement st=con.createStatement();
		   //	System.out.println("connection success");
			ResultSet rs=st.executeQuery("select acc_no ,bal from b_acc where acc_no='"+acc+"'");
			while(rs.next()){
				String accno_s=rs.getString("acc_no");
				double bal_s=rs.getDouble("bal");
				double balanc=bal_s-amt;
				if(amt<bal_s)
				{
					 int s=st.executeUpdate("insert into trans(acc,credit,debit,bal,date) values ('"+accno_s+"',0,'"+amt+"','"+balanc+"','"+date+"')");
		        	 int y=st.executeUpdate("update b_acc set bal='"+balanc+"' where acc_no='"+accno_s+"'");
				}
				else
					{%>
		        	<p align="left" style="line-height:18px; padding:10px; font-weight:normal"><font color="#FF0000">Sorry!!!Not enough balance to Transfer<br></font></p>
		        	 Current Account Balance :Rs.<%=bal_s %>
		       <%  }
				
			
			ResultSet sr=st.executeQuery("select acc_no ,bal from b_acc where acc_no='"+dacc+"'");
			  while(sr.next()){
				String accno_r=sr.getString("acc_no");
				double bal_r=sr.getDouble("bal");
				double balance=bal_r+amt;
				 if((accno_r.equals(dacc)))
			     {
			    	 int s=st.executeUpdate("insert into trans(acc,credit,debit,bal,date) values ('"+accno_r+"','"+amt+"',0,'"+balance+"','"+date+"')");
		        	 int y=st.executeUpdate("update b_acc set bal='"+balance+"'where acc_no='"+accno_r+"'");
		        	 int w=st.executeUpdate("insert into ontrans(fro_acc,to_acc,date,amt)values('"+acc+"','"+dacc+"','"+date+"','"+amt+"')");	
		        	 
		 			 response.sendRedirect("suctrans.jsp");
			     }
				 else{
						%>
						<font color="#FF0000">Invalid Account Number.<br/>
						<%
					}
				 }
			  		
			
		}
			 
			
			 %>
			 
			
			
            
            
            <%
			
		  }
			 catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}%>
        
        
        
        
        </center></td>
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