<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<pre>
	* forward 액션 태그
	- 현재 JSP 페이지에서 다른 페이지로 이동
	- JSP 컨테이너는 forward 액션 태그를 만나면 그 전까지 출력 버퍼에 저장되어 있던 내용을 모두 비움
	- 설정된 페이지로 프로그램의 제어가 이동
	</pre>
	<h3>이 파일은 first.jsp입니다.</h3>
	<jsp:forward page="second.jsp" />
	<p>== first.jsp의 페이지 ==</p>
</body>
</html>