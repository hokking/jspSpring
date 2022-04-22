<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	세션을 종료하였습니다.
</body>
</html>
<%
	response.sendRedirect("session.jsp");
%>