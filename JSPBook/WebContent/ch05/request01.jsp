<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>request 객체</title>
</head>
<body>
	<form method="post" action="request01_process.jsp">
		<p>아 이 디 : <input type="text" name="id"/></p>
		<p>비밀번호 : <input type="text" name="passwd"/></p>
		<p><input type="submit" value="전송"/></p>
	</form>
</body>
</html>