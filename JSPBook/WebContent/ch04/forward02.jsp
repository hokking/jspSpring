<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<h4>구구단 출력하기</h4>
	<jsp:forward page="forward02_data.jsp">
		<jsp:param value="5" name="num"/>
	</jsp:forward>
</body>
</html>