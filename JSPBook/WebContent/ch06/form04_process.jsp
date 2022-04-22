<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<h3>선택한 과일</h3>
<%
	request.setCharacterEncoding("utf-8");
	String[] fr = request.getParameterValues("fr");
	
	for(String s : fr) {
		out.print(s + "&nbsp;");
	}
%>
</body>
</html>