package com.abc;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class Gate
 */
public class Gate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Gate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String username = request.getParameter("uname");
		Boolean checkResult = authCheck(username);
		if(checkResult == true) {
			if(username.equals("admin")) {
				RequestDispatcher rd = request.getRequestDispatcher("UserServlet");
				HttpSession session = request.getSession();
				session.setAttribute("user", username);
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("store.jsp");
				HttpSession session = request.getSession();
				session.setAttribute("user", username);
				rd.forward(request, response);
			}
		}
		else {
			PrintWriter out = response.getWriter();
			out.print("<h1>error!</h1>");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
	}
	public Boolean authCheck(String username) {
		Boolean result = false;
		UserDAO userDAO = new UserDAO();
		Connection conn = userDAO.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement("select name from users where name=(?)");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				if(rs.getString("name").equals(username))
					result = true;
			}
		} catch (SQLException e) {e.printStackTrace();}
		return result;
	}

}
