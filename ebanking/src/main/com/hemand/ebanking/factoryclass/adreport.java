package com.hemand.ebanking.factoryclass;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adreport")
public class adreport extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public adreport() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int acc_no=Integer.parseInt(request.getParameter("accno"));
		String uname=request.getParameter("uname");
		GetStatement gs=new GetStatement();
		gs.findUser(uname, acc_no);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
