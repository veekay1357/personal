package com.hemand.ebanking.login;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.Document;

/**
 * Servlet implementation class doLogin
 */
@WebServlet("/doLogin")
public class doLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tiuname = request.getParameter("username");
		String tipass = request.getParameter("password");
		String option=request.getParameter("op");
        PrintWriter out=response.getWriter();
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebank","root","root");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from login where name='"+tiuname+"' and pass='"+tipass+"'");
			HttpSession session=request.getSession();
			
			while(rs.next())
			{
				String type=rs.getString("type");
				String uname =rs.getString("name");
				String pswd =rs.getString("pass");
				
				if(tiuname.equals(uname) && tipass.equals(pswd))
				{
					if((option.equals("User"))&&(type.equals("User")))
					{
						session.setAttribute("uname", uname);
						RequestDispatcher rd =request.getRequestDispatcher("welu.jsp");
						rd.forward(request,response);
				    }
					else if((option.equals("Employee"))&&(type.equals("Employee")))
					{
						session.setAttribute("uname", uname);
						RequestDispatcher rd =request.getRequestDispatcher("wele.jsp");
						rd.forward(request,response);
				    }
					else if ((option.equals("Admin"))&&(type.equals("Admin")))
					{
							session.setAttribute("uname", uname);
							RequestDispatcher rd =request.getRequestDispatcher("welad.jsp");
							rd.forward(request,response);
					}
					else
					{
			         RequestDispatcher rd =request.getRequestDispatcher("fail.html");
						rd.forward(request,response);
					}
					}
				else
				{
					System.out.print("enetr");
		         RequestDispatcher rd =request.getRequestDispatcher("fail.html");
					rd.forward(request,response);
				}
				}
	}
		catch (Exception e) {
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
