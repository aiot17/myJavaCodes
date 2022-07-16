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
<jsp:include page="header.jsp"/><br><br>
<a href="UserServlet">return</a><br><br>
<form id="i1" action="LogOut">
<input type="submit" value="log-out"><br>
</form>
<div class="card-body">
				
<form action="Update" method="post">
<caption><h2>Edit User</h2></caption>
<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
<fieldset class="form-group">
	<label>User Name</label> <input type="text" name="name"
		value="<c:out value='${user.name}' />" class="form-control" required="required">
</fieldset>
<fieldset class="form-group">
	<label>User Email</label> <input type="text" name="email"
		value="<c:out value='${user.email}' />" class="form-control">
</fieldset>
<fieldset class="form-group">
	<label>User Country</label> <input type="text" name="country"
		value="<c:out value='${user.country}' />" class="form-control">
	</fieldset>
<input type="submit" value="update">
</form>
</div>
</body>
</html>