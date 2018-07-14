package com.hemand.ebanking.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.hemand.ebanking.VO.UserebankVO;
import com.hemand.ebanking.bean.Userebankbean;

public class UserebankDAO 
{
	public void usercheck(UserebankVO ueb)
	{
		Userebankbean user = new Userebankbean();
		user.setTiuname(ueb.tiuname);
        user.setTiupass(ueb.tiupass);
        user.setTiaccount(ueb.tiaccount);
        user.setTipin(ueb.tipin);
		try
		{
        Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","");
		Statement st=con.createStatement();
		System.out.println("connection success");
		ResultSet rs=st.executeQuery("select acc_no,pin from b_acc");
		int f=0;
		while(rs.next())
		{
			String account=rs.getString("acc_no");
			String pin=rs.getString("pin");
			
			if((account.equals(user.tiaccount))&&(pin.equals(user.tipin)))
			{
				ResultSet rr=st.executeQuery("SELECT uname FROM USER");
				while(rr.next())
				{
					String uname=rr.getString("uname");
					if(uname.equals(user.tiuname))
						{	
						    System.out.println("Duplicate Entry");	
						}
					else
						{
						    addUserDetails(user);									
						}
				}
        	}
			else
			{	
				f=1;
			} 
		
	}
  if(f==1)
  {
		System.out.println("Entered username and pin are incorrect");
  }
		}catch(Exception e) {System.out.println(e);}
}	

	void addUserDetails(Userebankbean user) {
		try {
			Configuration configuration = new Configuration().configure();

			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			
			session.save(user);
			
			transaction.commit();
			
			System.out.println("\n\n Details Added \n");

		} catch (HibernateException e) {
			
			System.out.println(e.getMessage());
			
			System.out.println("error");
		}

	}
}