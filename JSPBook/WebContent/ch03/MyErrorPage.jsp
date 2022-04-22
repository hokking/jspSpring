<%@page import="java.io.PrintWriter"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directive Tag</title>
</head>
<body>
	<img alt="500 오류 발생" src="/images/500.png" title="500 오류 발생">
<!-- 	<h4>errorPage Directive Tag</h4> -->
<!-- 	<h5>오류가 발생했습니다.</h5> -->
<!-- 	* page 디렉티브의 isErrorPage 속성은 <br /> -->
<!-- 	현재 JSP 페이지가 오류 페이지인지 여부를 설정하는 데 사용<br /> -->
<!-- 	기본값은 false<br /> -->
<%
// 	exception.printStackTrace(new PrintWriter(out));
%>
</body>
</html>