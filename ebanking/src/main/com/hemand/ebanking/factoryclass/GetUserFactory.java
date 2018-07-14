package com.hemand.ebanking.factoryclass;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import EasyXLS.ExcelAutoFormat;
import EasyXLS.ExcelDocument;
//import EasyXLS.*;
import EasyXLS.Constants.*;

public class GetUserFactory 
{
	public User getUser(String userType)
    {  
	   if(userType == null)
	      {  
	          return null;  
	      }  
	   if(userType.equalsIgnoreCase("User")) 
	      {  
	          return new Nuser();  
	      }   
	   else if(userType.equalsIgnoreCase("Employee"))
	      {  
	          return new Employee();  
	      }   
	   else if(userType.equalsIgnoreCase("Admin")) 
	      {  
	          return new Admin();  
	      }  
	      return null;  
	 } 
}

class GetStatement
{  
   void findUser(String usern,int accno)
     {  
        GetUserFactory userFactory = new GetUserFactory(); 
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","root");
	        con.setAutoCommit(false);
            Statement st=con.createStatement();
	        ResultSet sm=st.executeQuery("select * from login where name='"+usern+"'");
	        while(sm.next())
	        {
	            String usert=sm.getString("type");
                User u = userFactory.getUser(usert);
                st.setFetchSize(u.count);
	            ResultSet rs=st.executeQuery("select * from trans where acc='"+accno+"'");
	            
	            ExcelDocument workbook = new ExcelDocument();
	            System.out.println("Writing file C:\\Users\\ASUS\\Downloads\\Bank_statement.xls.");
	            workbook.easy_WriteXLSFile_FromResultSet("C:\\Users\\ASUS\\Downloads\\Bank_statement.xls", rs, 
	                    new ExcelAutoFormat(Styles.AUTOFORMAT_EASYXLS1), "Sheet1");

	            if (workbook.easy_getError().equals(""))
	                System.out.println("File successfully created.");
	            else
	                System.out.println("Error encountered: " + workbook.easy_getError());
            }
	    }catch (Exception e) 
            {
                e.printStackTrace();
            }
    }
}