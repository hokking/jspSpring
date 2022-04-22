<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();

	for(int i = 0; i < cookies.length; i++) {
		// 쿠키 삭제 : 유효 시간을 0으로 설정
		cookies[i].setMaxAge(0);
		response.addCookie(cookies[i]);
	}
	response.sendRedirect("cookie02.jsp");
%>
</body>
</html>