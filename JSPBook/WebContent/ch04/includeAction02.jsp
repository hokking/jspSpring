<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<h4><%= pageContext.getAttribute("id") %></h4>
	<h4><%= request.getAttribute("id") %></h4>
	<h4><%= session.getAttribute("id") %></h4>
	<h4><%= application.getAttribute("id") %></h4>
	<h3>이 파일은 includeAction02.jsp입니다.</h3>
	Today is : <%= new Date() %>
</body>
</html>