<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
%>
	<c:set var="num" value="<%= num %>"/>
	<c:forEach var="i" begin="1" end="9" step="1">
		<p>${num} * ${i} = ${num * i}</p>
	</c:forEach>

<%
	for(int i = 1; i < 10; i++) {
%>
		<p><%= num %> * <%= i %> = <%= num*i %></p>
<%
	}
%>
</body>
</html>