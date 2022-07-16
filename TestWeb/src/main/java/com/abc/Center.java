package com.abc;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

import org.apache.catalina.connector.Response;

/**
 * Servlet implementation class Center
 */
public class Center extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	PrintWriter out;
	/**
     * @see HttpServlet#HttpServlet()
     */
    public Center() {
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
		out = response.getWriter();
		Merge m = new Merge();
		Set<Integer> result = m.merge();
		request.setAttribute("result", result);
		RequestDispatcher rd = request.getRequestDispatcher("Test.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void triangle1(HttpServletRequest request, HttpServletResponse response) throws Exception, IOException {
		out.print("<div style='margin':'auto'>");
		for(int i=1;i<=5;i++) {
			for(int j=1;j<=5;j++) {
				if(j<=i) {
					out.print(j);
				}
			}out.print("<br>");
		}
		for(int i=1;i<=5;i++) {
			for(int j=1;j<=5;j++) {
				if(j>=i) {
					out.print(i);
				}
			}out.print("<br>");
		}
		int totalRows = 5;
		for(int row=1;row<=5;row++) {
			for(int space=1;space<totalRows-row+1;space++) {
				out.print(" ");
			}
			for(int num=1;num<row+1;num++) {
				out.print(row);
			}out.println("<br>");
		}
		int totalRows2 = 5;
		for(int row=1;row<=5;row++) {
			for(int space=1;space<row;space++) {
				out.print(" ");
			}
			for(int num=1;num<=totalRows-row+1;num++) {
				out.print(row);
			}out.println("<br>");
		}out.print("</div>");
//		RequestDispatcher rd = request.getRequestDispatcher("TestWeb.jsp");
//		rd.forward(request, response);
//		response.sendRedirect("TestWeb.jsp");
	}

}
