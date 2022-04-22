<%@page import="ch04.com.dao.Calculator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
<%
// 	Calculator bean = new Calculator();

// 	int m = bean.process(5);
	
// 	out.print("5의 3제곱은 : " + m);
%>
	<jsp:useBean id="bean" class="ch04.com.dao.Calculator" />
<%
	int m = bean.process(5);

	out.print("5의 3제곱은 : " + m);
%>
</body>
</html>