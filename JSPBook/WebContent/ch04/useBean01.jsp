<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
<%
// 	Date date = new Date();
%>
	<jsp:useBean id="date" class="java.util.Date" />
	<p>오늘 날짜 및 시간 : </p>
	<p><%= date %></p>
</body>
</html>