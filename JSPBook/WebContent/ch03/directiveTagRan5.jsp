<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*, java.lang.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>Directive Tag</title>
</head>
<body>
	Today is : <%= new Date() %>
	<hr />
	page Directive import 속성 : JSP 페이지에서 사용할 자바 클래스 설정<br />
	JSP 컨테이너가 자동으로 java.io.*와 java.lang.* 패키지를 가져와줌<br />
	* page session="true"<br />
	page Directive의 session 속성 : 현재 JSP 페이지의 HTTP 세션 사용 여부 설정<br />
	기본값은 true(세션을 자동으로 사용함)이고, 생략 가능<br />
	
</body>
</html>