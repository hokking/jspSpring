<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("id");
	String passWd = request.getParameter("passwd");
%>
	<p>아이디 : <%= userId %> / ${param.id}</p>
	<p>비밀번호 : <%= passWd %> / ${param.passwd}</p>
</body>
</html>