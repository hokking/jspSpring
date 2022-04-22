<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script type="text/javascript">
	function checkLogin() {
		var form = document.loginForm;
		if(form.id.value == "") {
			alert("아이디를 입력해주세요");
			form.id.focus();
			return false;
		} else if(form.passwd.value == "") {
			alert("비밀번를 입력해주세요");
			// 해당 입력 항목에 커서 위치
			form.passwd.focus(); 
			return false;
		}
		// validation02_process.jsp요청
		form.submit();
	}
</script>
</head>
<body>
	<form name="loginForm" action="validation02_process.jsp" method="post">
		<p>아이디 : <input type="text" name="id" /></p>
		<p>비밀번호 : <input type="password" name="passwd" /></p>
		<p><input type="button" value="전송" onclick="checkLogin()" /></p>
	</form>
</body>
</html>