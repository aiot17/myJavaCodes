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

import javax.naming.InitialContext;

import org.apache.catalina.connector.Response;

/**
 * Servlet implementation class Try1
 */

public class Try1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String driverLocation;
	String jdbcUrl;
	String jdbcPassword;
	String jdbcUsername;
	public Try1() {
        super();
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
		Enumeration<String> e = context.getInitParameterNames();
		String str = "";
		List<String> keys = new ArrayList<String>();
		while(e.hasMoreElements()) {
			str = e.nextElement();
			keys.add(context.getInitParameter(str));
		}
		driverLocation = keys.get(0);
		jdbcUrl = keys.get(1);
		jdbcPassword = keys.get(2);
		jdbcUsername = keys.get(3);
		try {
			Class.forName(driverLocation);
			Connection conn = DriverManager.getConnection(jdbcUrl,jdbcUsername,jdbcPassword);
			/*本servlet Try1重點: 設置專案中的通用conn物件
			 * 這樣同專案的其他servlet,若要使用同樣的sql,
			 * 就不用反覆撰寫conn語法
			 * 把已經寫好的conn存入servletContext
			 * */
			context.setAttribute("conn", conn);
			/*上行是重點*/
			out.print("<a href='Try2'>Try2</a>");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
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
