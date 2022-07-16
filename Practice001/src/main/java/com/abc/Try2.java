package com.abc;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

/**
 * Servlet implementation class Try2
 */
public class Try2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Try2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		ServletContext context = getServletContext();
		try {
			/*�I�sTry1�bservletContext���]�m�n��conn����
			 * Try2 servlet�N�L�ݦA���Ƽgconn�y�k
			 * */
			Connection conn = (Connection) context.getAttribute("conn");
			/*�W��O���I, �qservletContext���X����,
			 * ���૬��Connection����,�N�i�ϥΩI�s��Ʈw
			 * */
			List<User> user = fullList(conn);
			for(User u:user) {
				out.print(u.getId()+",  "+u.getName()+",  "+u.getEmail()+",  "+u.getCountry()+"<br>");
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

	public List<User> fullList(Connection conn){
		String all = "select * from users";
		List<User> users = new ArrayList<User>();
		try {
			PreparedStatement ps = conn.prepareStatement(all);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");
				users.add(new User(id,name,email,country));
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return users;
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
