<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 로그인 인중(login.jsp)에 실패 시 강제 이동
	response.sendRedirect("login.jsp?error=1");
%>