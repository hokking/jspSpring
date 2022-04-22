<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="MyErrorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Directive Tag</title>
</head>
<body>
<%
	String str = null;
	// 오류발생 -> page 디렉티브의 errorPage 속성의 값으로 
	// MyErrorPage.jsp URL로 이동
	out.print(str.toString());
%>
</body>
</html>