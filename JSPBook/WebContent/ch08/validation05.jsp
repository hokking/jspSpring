<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script>
	function checkMember() {
		// 아이디 : 숫자, 영문만 입력
		var regExpId = /^[0-9a-zA-Z]+$/;
		// 비밀번호 : 숫자, 특수문자 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력
		var regExpPasswd = /(?=.*\d{1,50})(?=.*[~`!@#$%^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
		// 이름 : 한글 검사
		var regExpName = /^[가-힣]+$/;
		// 전화번호 형식인지 검사
		var regExpPhone = /^\d{2,3}-\d{3,4}-\d{4}$/;
		// 이메일 형식인지 검사
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		var form = document.Member;
		
		var id = form.id.value;
		var passwd = form.passwd.value;
		var name = form.name.value;
		var phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
		var email = form.email.value;
		
		// 정규표현식.test(변수)
		if(!regExpId.test(id)) {
			alert("아이디는 숫자, 영문만 입력 가능합니다.");
			form.id.select();
			return;
		}
		if(!regExpPasswd.test(passwd)) {
			alert("비밀번호는 숫자, 특수문자 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력 가능합니다.");
			form.passwd.select();
			return;
		}
		if(!regExpName.test(name)) {
			alert("이름은 한글만 입력 가능합니다.");
			form.name.select();
			return;
		}
		if(!regExpPhone.test(phone)) {
			alert("연락처 형식에 맞게 입력해주세요.");
			form.phone2.select();
			return;
		}
		if(!regExpEmail.test(email)) {
			alert("이메일 형식에 맞게 입력해주세요.");
			form.email.select();
			return;
		}
		
		// 모든 테스트 통과 시
		form.submit();
		
	}
</script>
</head>
<body>
	<h3>회원 가입</h3>
	<form name="Member" method="post" action="validation05_process.jsp">
		<p>아이디 : <input type="text" name="id"></p>
		<p>비밀번호 : <input type="text" name="passwd"></p>
		<p>이름 : <input type="text" name="name"></p>
		<p>아이디 : 
			<select name="phone1">
				<option value="010">010</option>
				<option value="010">010</option>
				<option value="010">010</option>
				<option value="010">010</option>
				<option value="010">010</option>
			</select> 
			- <input type="text" maxlength="4" size="4" name="phone2">
			- <input type="text" maxlength="4" size="4" name="phone3">
		</p>
		<p>이메일 : <input type="text" name="email"></p>
		<p><input type="button" value="가입하기" onclick="checkMember()"></p>
	</form>
</body>
</html>