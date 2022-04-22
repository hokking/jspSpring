<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
<!-- 선언문 -->
<%!
	String data = "Hello, Java Server Pages";
	
	public String getString(String data) {
		return data;
	}
%>
<!-- 스크립트릿 -->
<%
	String res = getString(data);
%>
<!-- 표현식 -->
	<h2><%= res %></h2>
</body>
</html>