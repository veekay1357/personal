package com.hemand.ebanking.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.hemand.ebanking.VO.UseraccVO;
import com.hemand.ebanking.bean.Useraccbean;

public class UserDAO 
{
	public void addUserDetails(UseraccVO ua) {
		try {
			Configuration configuration = new Configuration().configure();

			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			
			Useraccbean user = new Useraccbean();
			
			user.setAccno(ua.accno);
	        user.setName(ua.name);
	        user.setGen(ua.gen);
	        user.setDob(ua.dob);
	        user.setDoj(ua.doj);
	        user.setAdd(ua.add);
	        user.setMob(ua.mob);
	        user.setEmail(ua.email);
	        user.setAcctype(ua.acctype);
	        user.setPin(ua.pin);
	        user.setBal(ua.bal);
			
	        session.save(user);
			transaction.commit();
			
			System.out.println("\n\n Details Added \n");

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error");
		}
	}
}
