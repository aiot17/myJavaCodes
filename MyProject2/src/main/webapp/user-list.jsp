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
	.d1{
		width:800px;
		margin:auto;
	}
	
	.t1{
		border:3px solid black;
		margin:auto;
		margin-top:30px;
	}
	th,td{
		border:3px solid black;
		border-collapse:collapse;
		text-align:center;
	}
	tbody tr:nth-child(2n){
	 	background-color:orange;
	}
	#i1{
		float:right;
	}
	#p1{
		text-align:center;
		color:lightgreen;
		font-size:3em;
	}
	</style>
</head>
<body>

<jsp:include page="header.jsp"/>
<div>
<form id="i1" action="addOne.jsp">
<input type="submit" value="add user"><br>
</form><br><br>
<form id="i1" action="LogOut">
<input type="submit" value="log-out"><br>
</form>
</div>
<div class="d1">
<p id="p1">Member List</p>

<table class="t1">
<thead>
<tr>
<th>ID</th><th>Name</th><th>Email</th><th>Country</th></tr>
</thead>
<tbody>
<c:forEach var="user" items="${listUser}">
<tr>
	<td><c:out value="${user.id}" /></td>
	<td><c:out value="${user.name}" /></td>
	<td><c:out value="${user.email}" /></td>
	<td><c:out value="${user.country}" /></td>
	<td><!-- <a href="user-form.jsp?id=<c:out value='${user.id}' />">Edit</a> -->
		<form action="Update">
		<input type="hidden" name="id" value="${user.id}"/>
		<input type="submit" value="Update">
		</form>
		&nbsp;&nbsp;&nbsp;&nbsp; <form action="Remove">
		<input type="hidden" name="id" value="${user.id}"/>
		<input type="submit" value="delete">
		</form></td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>
</body>
</html>