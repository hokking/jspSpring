<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<p>오늘은 며칠? 그리고 지금 시간은?</p>
	<p><%= (new Date()).toLocaleString() %></p>
	<p>Today is : <%= request.getParameter("date") %></p>
</body>
</html>