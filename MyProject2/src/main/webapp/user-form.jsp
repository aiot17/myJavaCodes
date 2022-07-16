<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="card-body">
<!--<c:if test="${user != null}">
<form action="update" method="post">
</c:if>
<c:if test="${user == null}">-->
<form action="addUser" method="post">
<!--</c:if>-->
<caption>
<h2>
<!--<c:if test="${user != null}">
Edit User
</c:if>
<c:if test="${user == null}">-->
Add New User
<!--</c:if>
</h2>-->
</caption>
<!--<c:if test="${user != null}">
<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
</c:if>-->
<fieldset class="form-group">
<label>User Name</label> <input type="text"value="<c:out value='${user.name}' />" class="form-control"
		name="name" required="required">
</fieldset>
<fieldset class="form-group">
<label>User Email</label> <input type="text" value="<c:out value='${user.email}' />" class="form-control" name="email">
</fieldset>
<fieldset class="form-group">
<label>User Country</label> <input type="text"
		value="<c:out value='${user.country}' />" class="form-control" name="country">
</fieldset>
<input type="submit" value="add-one" class="btn btn-success">
</form>
</div>
		
	
</body>
</html>