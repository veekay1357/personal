package com.hemand.ebanking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hemand.ebanking.VO.UseraccVO;
import com.hemand.ebanking.dao.UserDAO;


@WebServlet("/docrate")
public class UserAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		UseraccVO ua=new UseraccVO();
		ua.accno = request.getParameter("accno");
        ua.name = request.getParameter("acname");
        ua.gen = request.getParameter("gen");
        ua.dob = request.getParameter("dob");
        ua.doj = request.getParameter("doj");
        ua.add = request.getParameter("add");
        ua.mob = request.getParameter("mob");
        ua.email = request.getParameter("email");
        ua.acctype = request.getParameter("acctype");
        ua.pin= request.getParameter("pin");
        ua.bal=request.getParameter("bal");
        
        try {
        	UserDAO ud = new UserDAO();
			ud.addUserDetails(ua);
			response.sendRedirect("Success");
		} catch (Exception e) {

			e.printStackTrace();
		}
	
	}

}
