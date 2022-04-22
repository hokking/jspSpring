<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script type="text/javascript">
	// 핸들러 함수
	function CheckForm() {
		console.log("아이디 : " + document.loginForm.id.value);
		console.log("비밀번호 : " + document.loginForm.passwd.value);
	}
</script>
</head>
<body>
	<form name="loginForm">
		<p>아이디 : <input type="text" name="id" /></p>
		<p>비밀번호 : <input type="password" name="passwd" /></p>
		<p><input type="button" value="전송" onclick="CheckForm()" /></p>
	</form>
</body>
</html>