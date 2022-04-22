<%@page import="ch04.com.dao.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
<%
// 	Person person = new Person();
%>
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
	<p>아이디 : <%= person.getId() %></p>
	<p>이름 : <%= person.getName() %></p>
</body>
</html>