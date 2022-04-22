<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>response 내장 객체</title>
</head>
<body>
<%
	// 페이지를 이동하고 싶을 때...
	// 설정한 URL 페이지로 강제 이동
	response.sendRedirect("request03.jsp");
%>
</body>
</html>