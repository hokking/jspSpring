<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>response 내장 객체</title>
</head>
<body>
	<form method="post" action="response01_process.jsp">
		<p>아이디 : <input type="text" name="id"></p>
		<p>비밀번호 : <input type="text" name="pass"></p>
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>