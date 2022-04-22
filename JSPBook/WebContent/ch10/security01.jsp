<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Security</title>
</head>
<body>
	<h2>인증 성공했습니다.</h2>
	<h4>사용자명 : <%=request.getRemoteUser()%></h4>
	<h4>인증방법 : <%=request.getAuthType()%></h4>
	<h4>
		역할명(role) tomcat에 속한 사용자가 로그인한건가요?
		<%=request.isUserInRole("tomcat") %>
	</h4>
	<h4>
		역할명(role) role1에 속한 사용자가 로그인한건가요?
		<%=request.isUserInRole("role1") %>
	</h4>
</body>
</html>