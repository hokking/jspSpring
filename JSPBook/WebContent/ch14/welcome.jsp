<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	Cookie[] cookie = request.getCookies();

	if(cookie == null) {
		response.sendRedirect("cookie_out.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<h2><%=cookie[0].getValue()%>님 반갑습니다.</h2>
	<a href="cookie_out.jsp">로그아웃</a>
</body>
</html>