<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 로그아웃
	// security를 통해 로그인 인증을 할 때 웹 브라우저에 저장된 모든 사용자를 삭제함
	session.invalidate();
	response.sendRedirect("addProduct.jsp");
%>