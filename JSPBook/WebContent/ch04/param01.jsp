<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
 <h3>param 액션 태그</h3>
 <!-- ...01_data.jsp?id=admin&name=관리자 -->
 <jsp:forward page="/ch04/param01_data.jsp">
 	<jsp:param name="id" value="potato"/>
 	<jsp:param name="name" value="<%= URLEncoder.encode("감자언니 내가 뭐 바꿔놨게 ㅋ  ") %>"/>
 </jsp:forward>
 <p>Java Servlet Page</p>
</body>
</html>