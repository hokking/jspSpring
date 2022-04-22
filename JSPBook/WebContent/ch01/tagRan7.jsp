<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<p>오늘은 몇일? <%= new java.util.Date() %></p>
	
<%
	int a = 10;
	int b = 20;
	int c = 30;
%>
<p>a + b + c = <%= a + b + c %></p>
</body>
</html>