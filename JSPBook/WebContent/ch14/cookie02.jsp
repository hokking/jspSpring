<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 쿠키 정보 얻어오기
	Cookie[] cookies = request.getCookies();

	for(int i = 0; i < cookies.length; i++) {
		out.print("설정된 쿠키의 속성 명 [" + i + "] : " + cookies[i].getName() + "<br />");
		out.print("설정된 쿠키의 속성 값 [" + i + "] : " + cookies[i].getValue() + "<br />");
		out.print("=====================================<br />");
	}
%>