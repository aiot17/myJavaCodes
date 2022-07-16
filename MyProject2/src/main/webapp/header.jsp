<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	HttpSession s = request.getSession(false);
	String user = (String)s.getAttribute("user");
	if (user != null){
		out.print(user+", 您好!<br><br>");
	}else{out.print("訪客, 您好!<br><br>");}
%>
<!-- <%= user+" , 您好!" %> -->

</body>
</html>