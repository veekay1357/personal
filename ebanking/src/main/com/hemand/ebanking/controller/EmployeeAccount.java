package com.hemand.ebanking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hemand.ebanking.VO.EmpaccVO;
import com.hemand.ebanking.dao.EmployeeDAO;

@WebServlet("/empacc")
public class EmployeeAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EmployeeAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		EmpaccVO eacc=new EmpaccVO();
		
		eacc.eid=request.getParameter("empid");
	    eacc.enam=request.getParameter("empnam");
	    eacc.emob=request.getParameter("emplmob");
	    eacc.eem=request.getParameter("emplem");
	    eacc.eus=request.getParameter("emplnus");
	    eacc.epas=request.getParameter("emplpas");
	    
	    try {
        	EmployeeDAO ed = new EmployeeDAO();
			ed.addUserDetails(eacc);
			response.sendRedirect("Success");
		} catch (Exception e) {

			e.printStackTrace();
		}
	
	}

}
