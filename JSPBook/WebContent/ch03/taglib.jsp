<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
<!-- 
	var : 변수
	begin : 시작
	end : 종료
	step : 증가값
 -->
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:out value="${i}"></c:out>
	</c:forEach>
	<pre>
	* taglib Directive?
	현재 JSP 페이지에 표현 언어(EL), JSTL, 사용자 정의 태그(custom tag)와 같은 
	태그 라이브러리를 설정하는 태그임
	taglib uri="경로" prefix="태그 식별자"
	
	* 원리?
	taglib 디렉티브 태그가 서블릿 프로그램으로 번역됨.
	uri 경로가 JSP 컨테이너에게 사용자가 정의한 태그 라이브러리의 위치를 알려줌
	prefix 속성의 값(c, fmt)은 사용자가 정의한 태그 라이브러리의 접두어 태그가 무엇인지  
	JSP 컨테이너에 알려주는 역할을 함
	</pre>
</body>
</html>