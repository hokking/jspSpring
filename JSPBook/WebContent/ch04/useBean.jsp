<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<h4>구구단 출력하기</h4>
	<jsp:useBean id="gugudan" class="ch04.com.dao.Gugudan">
	<c:forEach var="i" begin="1" end="9" step="1">
		5 * ${i} = ${gugudan.process1(5, i)} <br />
	</c:forEach>
<%
	String m = gugudan.process(5);
	out.print(m);
%>
	</jsp:useBean>
</body>
</html>