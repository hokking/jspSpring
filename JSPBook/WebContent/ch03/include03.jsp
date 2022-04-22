<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%@ include file="/ch03/header.jsp" %>
	현재 시간 : <%= Calendar.getInstance().getTime() %>
	
<%
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

	String date = format.format(Calendar.getInstance().getTime());
	out.print(date + "<br />");
	
	date = format.format(new Date());
	out.print(date + "<br />");
	
	Date dt = format.parse("2022-01-04");
	out.print(date + "<br />");
%>
</body>
</html>