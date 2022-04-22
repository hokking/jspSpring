<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>response 내장 객체</title>
</head>
<body>
	<p>이 페이지는 5초마다 새로고침 됩니다 </p>
<%
	response.setIntHeader("Refresh", 5);
	// 헤더 이름 name에 value를 추가함
// 	response.addHeader("ContentType", "text/html; charset=UTF-8");
	// 설정한 헤더 이름 name에 날짜/시간을 설정(1L : long date(초))
// 	response.setDateHeader("date", 1L);
	
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
%>
	<p><%= new Date() %></p>
	contentType : <%= response.getHeader("ContentType") %><br />
	date : <%= response.getHeader("date") %><br />
</body>
</html>