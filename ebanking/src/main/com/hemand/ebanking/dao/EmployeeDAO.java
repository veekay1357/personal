package com.hemand.ebanking.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.hemand.ebanking.VO.EmpaccVO;
import com.hemand.ebanking.bean.Empaccbean;

public class EmployeeDAO 
{
	public void addUserDetails(EmpaccVO ea) {
		try {
			Configuration configuration = new Configuration().configure();

			SessionFactory sessionFactory = configuration.buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			
			Empaccbean emp = new Empaccbean();
			
			emp.setEid(ea.eid);
	        emp.setEnam(ea.enam);
	        emp.setEmob(ea.emob);
	        emp.setEem(ea.eem);
	        emp.setEus(ea.eus);
	        emp.setEpas(ea.epas);
			
	        session.save(emp);
			transaction.commit();
			
			System.out.println("\n\n Details Added \n");

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error");
		}
	}
}
