<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
 response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
 String username = (String)session.getAttribute("user");
 if(username==null)
	 response.sendRedirect("index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<style>
	body {background-color:#FFE4CA;}
	</style>
</head>
<body>
<jsp:include page="header.jsp"/><br>
<a href="UserServlet">return</a><br><br>
<form id="i1" action="LogOut">
<input type="submit" value="log-out"><br>
</form>
<form action="addUser" method="post">
<caption>
<h2>
Add New User
</h2>
</caption>
User Name: <input type="text" name="uname"><br><br>
User Email: <input type="text" name="email"><br><br>
User Country: <input type="text" name="country"><br><br>
<input type="submit" value="add-one">
</form>
</body>
</html>