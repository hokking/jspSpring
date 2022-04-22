<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	out.print("이름 : " + request.getParameter("name") + "<br />");
	out.print("주소 : " + request.getParameter("addr") + "<br />");
	out.print("이메일 : " + request.getParameter("email") + "<br />");
%>