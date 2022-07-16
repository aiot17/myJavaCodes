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
			/*呼叫Try1在servletContext中設置好的conn物件
			 * Try2 servlet就無需再重複寫conn語法
			 * */
			Connection conn = (Connection) context.getAttribute("conn");
			/*上行是重點, 從servletContext取出物件,
			 * 並轉型成Connection物件,就可使用呼叫資料庫
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
