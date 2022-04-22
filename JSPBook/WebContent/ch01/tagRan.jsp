<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
	JSP 태그 : 문법을 기술
	1. 스크립트 태그(script tag) : HTML 내의 자바 코드
	 1) 선언문(&lt;%!) : 자바 변수나 메소드 정의
	 2) 스트립트릿(&lt;%) : 자바 로직 코드 작성
	 3) 표현식(&lt;%=) : 변수/계산/메소드호출 결과를 문자열로 출력
	2. 디렉티브 태그(directive tag) : JSP 설정
	3. 액션 태그(action tag) : 클라이언트/서버에 명령을 지시(XML형태)
-->

	<h2>Scripting Tag</h2>
<%!
	// 전역변수
	int count = 3;
	// 대문자 와라 단, 소문자로 변경될것임
	// data : 매개변수(파라미터를 받아주는 변수)
	// String ma... : 리턴타입
	String makeItLower(String data) {
		return data.toLowerCase();
	}
%>
<%
	for (int i = 1; i <= count; i++) {
		out.print("Java : " + i + "<br>");
	}
%>
<%= makeItLower("Hello Java!") %>
</body>
</html>