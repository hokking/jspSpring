<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
<!-- 문제 : 다음을 해결해보자 -->
<%
	out.print("2 + 3 = " + sum(2,3));
%>

<%!
	public int sum (int a, int b) {
		return a + b;	
	}
%>
</body>
</html>