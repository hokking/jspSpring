<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<form name="frm" method="post" action="form03_process.jsp">
		이름 : <input type="text" name="name" placeholder="홍길동"/><br />
		주소 : <input type="text" name="addr" placeholder="대전 중구 중앙로"/><br />
		이메일 : <input type="text" name="email" placeholder="email1234@email.com"/><br />
		<input type="submit" value="전송"/>
	</form>
</body>
</html>