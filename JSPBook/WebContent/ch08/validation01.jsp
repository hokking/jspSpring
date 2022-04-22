<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script type="text/javascript">
	function checkLogin() {
		var form = document.loginForm;
		
		if(form.id.value.length < 4 || form.id.value.length > 12) {
			alert("아이디는 4~12자 이내로 입력 가능");
			form.id.select();
			return;
		}
		
		if(form.passwd.value.length < 4) {
			alert("비밀번호는 4자 이상으로 입력해야 합니다");
			form.passwd.select();
			return;
		}
		
		if(!isNaN(form.name.value.substr(0,1))) {
			alert("이름은 숫자로 시작할 수 없습니다");
			form.name.select();
			return;
		}
		// 아이디 영문소문자 체킹 form.id.value : tesTer
		// t[0]e[1]s[2]T[3]e[4]r[5]
		for(itn i = 0; i < form.id.value.length; i++) {
			var ch = form.id.value.charAt(i);
			
			if((ch < 'a' || ch > 'z') && (ch > 'A' || ch < 'Z') && (ch > '0' || ch < '9')) {
				alert("아이디는 영문 소문자만 입력 가능합니다!");
				form.id.select();
				return;
			}
		}
		
		// 나이에 문자가 들어가면 안됨
		if(isNaN(form.age.value)) {
			alert("나이는 숫자만 입력 가능합니다");
			form.age.select();
			return;
		}
		
		form.submit();
	}
</script>
</head>
<body>
	<form name="loginForm" action="validation02_process.jsp" method="post">
		<p>아이디 : <input type="text" name="id" /></p>
		<p>비밀번호 : <input type="password" name="passwd" /></p>
		<p>이름 : <input type="text" name="name" /></p>
		<p>나이 : <input type="text" name="age" /></p>
		<p><input type="button" value="전송" onclick="checkLogin()" /></p>
	</form>
</body>
</html>