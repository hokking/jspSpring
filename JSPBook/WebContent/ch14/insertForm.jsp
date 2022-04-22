<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>MEMBER 테이블에 레코드 입력</title>
</head>
<body>
	<form method="post" action="insert.jsp">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="memberid" size="10"></td>
				<th>비밀번호</th>
				<td><input type="password" name="password" size="10"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" size="10"></td>
				<th>이메일</th>
				<td><input type="text" name="email" size="10"></td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="입력" /></td>
			</tr>
		</table>
	</form>
</body>
</html>