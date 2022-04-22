<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<p>오늘의 날짜 및 시간</p>
	<p><%= (new Date()).toLocaleString() %></p>
</body>
</html>