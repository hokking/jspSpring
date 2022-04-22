<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
Page Count is : 
<!-- 스크립트릿 -->
<%
	// 전역 메소드 호출
	out.print(myMethod(0));
%>

<!-- 선언문 태그 -->
<%!
	public int myMethod(int count) {
		// 전위증가	
		return ++count;
	}
%>
</body>
</html>