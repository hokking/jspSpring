<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>response 내장 객체</title>
</head>
<body>
<!--  
	* forward 방식과 redirect 방식의 차이?
	1) forward 방식 : 최초 요청 정보가 이동된 URL에서도 유효
	 - 이동할 URL로 요청 정보를 그대로 전달
	2) redirect 방식 : 최초 요청 정보가 이동된 URL에서 유효하지 않음
	 - 새로운 요청을 생성
-->
<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("id");
	String passWord = request.getParameter("pass");
	
	// 관리자 로그인 성공
	if(userId.equals("admin") && passWord.equals("1234")) {
		response.sendRedirect("response01_success.jsp");
	} else { // 관리자 로그인 실패
%>
		<jsp:forward page="response01_failed.jsp"/>
<%
// 		response.sendRedirect("response01_failed.jsp");
	}
%>
</body>
</html>