<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<p>아이디 : <%= request.getParameter("id") %></p>
	<%
		String name = request.getParameter("name"); 
		out.print("인코딩된 관리자 : " + name);
	%>
	<p>이름 : <%= URLDecoder.decode(name) %></p>
</body>
</html>