<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>request 내장 객체</title>
</head>
<body>
	<form method="post" action="process.jsp">
		<p>
			이름 : <input type="text" name="name" />&nbsp;
			<input type="submit" value="전송" />
		</p>
	</form>
</body>
</html>