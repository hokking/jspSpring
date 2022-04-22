<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	메소드를 사용하지 않고 쉽게 연산해보자<br>
<%
	int a = 2;
	int b = 3;
	int sum = a + b;
	out.print("2 + 3 = " + sum);
%>
</body>
</html>