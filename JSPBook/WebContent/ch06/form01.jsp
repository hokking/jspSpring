<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Form Processing</title>
</head>
<body>
	<h3>회원 가입</h3>
	<form name="member" action="#" method="post">
		<p>아이디 : <input type="text" name="id" />&nbsp;
				 <input type="button" value="아이디 중복 검사" /></p>
		<p>비밀번호 : <input type="password" name="passwd" /></p>
		<p>이름 : <input type="text" name="name" /></p>
		<p>
			연락처 : <input type="text" maxlength="4" size="4" name="phone1" />
				- <input type="text" maxlength="4" size="4" name="phone2" />
				- <input type="text" maxlength="4" size="4" name="phone3" />
		</p>
		<p>
			성별 : <input type="radio" name="gender" value="남성" checked />남성
				<input type="radio" name="gender" value="여성" />여성
		</p>
		<p>
			취미 : 독서<input type="checkbox" name="hobby1" checked />
				운동<input type="checkbox" name="hobby2" />
				영화<input type="checkbox" name="hobby3" />
		</p>
		<p>
			<select name="city" size="3">
				<optgroup label="대전광역시">
					<option value="동구">동구</option>
					<option value="중구">중구</option>
					<option value="서구">서구</option>
					<option value="유성구">유성구</option>
					<option value="대덕구">대덕구</option>
				</optgroup>
				<optgroup label="대전이외의 도시">
					<option value="서울시">서울특별시</option>
					<option value="경기도">경기도</option>
					<option value="인천시">인천광역시</option>
					<option value="충청도">충청도</option>
					<option value="전라도">전라도</option>
					<option value="경상도">경상도</option>
				</optgroup>
			</select>
		</p>
		<p>
			<input type="submit" value="가입하기" />
			<input type="reset" value="다시 쓰기" />
		</p>
	</form>
</body>
</html>