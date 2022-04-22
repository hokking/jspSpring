<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>request 내장 객체</title>
</head>
<body>
<!--  
	웹 브라우저(크롬)는 HTTP 헤더에 부가적인 정보를 담아 서버로 전송함
	request 내장 객체는 헤더 저보나 쿠키 관련 정보를 얻을 수 있는 메소드를 제공함
-->
<%
	String hostValue = request.getHeader("host");
	String aValue = request.getHeader("accept-language");
	
	out.print("호스트명 : " + hostValue + "<br />");
	out.print("설정된 언어 : " + aValue + "<br />");
	
	// 모든 헤더 이름을 가져옴(Enumeration 객체 타입으로 리턴)
	Enumeration en = request.getHeaderNames();
	while(en.hasMoreElements()) {
		String headerName = (String)en.nextElement();
		String headerValue = request.getHeader(headerName);
		
		out.print(headerName + " : " + headerValue + "<br />");
	}
	
	
%>
</body>
</html>