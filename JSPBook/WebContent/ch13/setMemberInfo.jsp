<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.setAttribute("MEMBERID", "ddit");
	session.setAttribute("NAME", "개똥's");
%>
<!DOCTYPE html>
<html>
<head>
<title>세션에 정보 저장</title>
</head>
<body>
	세션에 정보를 저장했습니다.<br />
	<a href="getMemberInfo.jsp">저장된 세션의 정보 보기</a>
</body>
</html>