<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String userid = (String)session.getAttribute("userID");

	if(userid == null) {
		response.sendRedirect("session_out.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<h2><%=userid%>님 반갑습니다.</h2>
	<a href="session_out.jsp">로그아웃</a>
</body>
</html>