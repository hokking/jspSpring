<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외 발생</title>
</head>
<body>
	요청 처리 과정에서 예외가 발생했습니다.<br />
	빠른 시간 내에 문제를 해결하도록 하겠습니다.<br />
	<p>
		오류 타입 : <%= exception.getClass().getName() %><br />
		오류 메시지 : <b><%= exception.getMessage() %></b>
	</p>
<!-- 
	인터넷 익스플로러는 오류 페이지의 길이가 513 바이트보다 작으면 
	자체적으로 제공하는 HTTP 오류 메시지를 화면에 출력.
	그래서 에러 페이지의 길이가 513 바이트 이상이 되도록 해주어야 함.
	주석에 지금처럼 아무 글이나 적어서 513 바이트 이상이 되도록 해주어야 함.
-->
</body>
</html>