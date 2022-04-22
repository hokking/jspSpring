<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>request 내장 객체</title>
</head>
<body>
<!--  
	* request 내장 객체란?
	- JSP 페이지에서 가장 많이 사용되는 기본 내장된 객체
	- 웹 브라우저(크롬)에서 서버(톰캣 포함)의 JSP 페이지로 전달하는 정보를 저장
	- form 페이지로부터 입력된 데이터를 전달하는 
		요청 파라미터(?name=개똥) 값을 JSP 페이지로 가져옴
	- ex) HttpServletRequest 객체 타입의 request 객체
-->
<%

	// form에서 입력한 한글이 request 객체에서  정상적으로 처리되려면 
	// 반드시 request 인코딩 세팅을 해야함
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
%>
	<p>이름 : <%= name %></p>
</body>
</html>