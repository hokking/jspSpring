<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/noParamEx.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터가 없는 오류가 발생함</title>
</head>
<body>
	/error/noParamEx.jsp를 생성하여 오류 처리<br />
	<pre>
		* 오류 페이지 처리 순서
		우선순위 1. page 디렉티브의 errorPage 속성 사용(전용 오류 처리)
		우선순위 2. web.xml 파일의 exception-type(범용 오류 처리)
		우선순위 3. web.xml 파일의 error-code(별도 오류 처리)
		우선순위 4. 우선순위 1~3까지 아무것도 안했다면.. 
				웹컨테이너(tomcat)가 제공하는 기본 오류 페이지 보여줌.
	</pre>
<%
	// memId=a001과 같은 파라미터가 없을 시 null을 toUpperCase하는 과정에서 오류 발생
	String memId = request.getParameter("memId").toUpperCase();
%>
</body>
</html>