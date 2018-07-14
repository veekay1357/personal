package com.hemand.ebanking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hemand.ebanking.VO.UserebankVO;
import com.hemand.ebanking.dao.UserebankDAO;


@WebServlet("/userebank")
public class UserEBanking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserEBanking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		UserebankVO ueb=new UserebankVO();
		ueb.tiuname = request.getParameter("username");
    	ueb.tiupass = request.getParameter("cpassword");
    	ueb.tiaccount = request.getParameter("account");
    	ueb.tipin = request.getParameter("pin");
    	
    	try {
        	UserebankDAO ud = new UserebankDAO();
			ud.usercheck(ueb);
			response.sendRedirect("Success");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
