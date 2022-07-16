<%@page import="org.eclipse.jdt.internal.compiler.ast.ArrayQualifiedTypeReference"%>
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
img{
	width:50%;
}
#btn1{
	width:10px;
}
table{
	border:3px solid lightgreen;
	margin: auto;
}
th,td{
	border:3px solid lightgreen;
	border-collapse:collapse;
	text-align:center;
}
#gtotal{
	text-align:right;
}
#t1{
	width:500px;
	text-align:center;
	padding:10px;
}
#tb tr:hover{
	background-color:	#A6FFFF ;
}
#last{
	background-color:purple;
	color:white;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/><br>
<form id="i1" action="LogOut">
<input type="submit" value="log-out"><br>
</form><br><br>
<table id="ta">
<tr>
<th>Item</th>
<th>Item name</th>
<th>Item price</th>
<th>quantity</th>
<th>subtotal</th>
</tr>
<% int[] price= {500,750,1000};
	int c = -1;
	int s = -1;
	int k = 0;
	int m = 0;
%>
<tbody id="tb">
<c:forEach var="i" begin="1" end="3">
<tr>
<td id="t1"><img id="i1" src="./images/<c:out value='${i}'/>.jpg"></td>
<td>金氏貼圖<c:out value="${i}"/></td>
<td id="price"><%=price[c+=1] %></td>
<td><input id="qt<%=k+=1%>" type="number" min="0" max="5" name="qty" value="0"/></td>
<td><span id="sp<%=m+=1%>"></span></td>
</tr>
</c:forEach>
</tbody>
<tr id="last">
<td id="gtotal" colspan="4">grand total: </td>
<!--<td></td>
<td></td>
<td></td>-->
<td id="total"></td>
</tr>
</table>

<script>
var t1=0;
var t2=0;
var t3=0;
var total=t1+t2+t3;
document.getElementById("qt1").onblur=function(){
	let qtValue = document.getElementById("qt1").value;
	let x = document.getElementById("qt1");
	let price = x.parentElement.previousElementSibling.innerHTML;
	t1 = parseInt(qtValue)* parseInt(price);
	//console.log(total);
	total=t1+t2+t3;
	document.getElementById("sp1").innerHTML= t1.toString();
	document.getElementById("total").innerHTML= total.toString();
};
document.getElementById("qt2").onblur=function(){
	let qtValue = document.getElementById("qt2").value;
	let x = document.getElementById("qt2");
	let price = x.parentElement.previousElementSibling.innerHTML;
	t2 = parseInt(qtValue)* parseInt(price);
	//console.log(total);
	total=t1+t2+t3;
	document.getElementById("sp2").innerHTML= t2.toString();
	document.getElementById("total").innerHTML= total.toString();
};
document.getElementById("qt3").onblur=function(){
	let qtValue = document.getElementById("qt3").value;
	let x = document.getElementById("qt3");
	let price = x.parentElement.previousElementSibling.innerHTML;
	t3 = parseInt(qtValue)* parseInt(price);
	//console.log(total);
	total=t1+t2+t3;
	document.getElementById("sp3").innerHTML= t3.toString();
	document.getElementById("total").innerHTML= total.toString();
};
</script>
</body>
</html>