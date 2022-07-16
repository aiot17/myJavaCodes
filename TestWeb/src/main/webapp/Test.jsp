<%@page import="java.util.Set"%>
<%@page import="java.util.Collections"%>
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

	//Set<Integer> r =(Set<Integer>)request.getAttribute("result");
	//out.print("displaying result:<br>");
	//int c = 1;
	//for(int j:r){
	//	out.print(c+": "+j+"<br>");
	//	c+=1;
	//}*/
	
%>
<c:forEach var="r" items="${requestScope.result}">
<c:out value="${r}"/><br>
</c:forEach>

</body>
</html>