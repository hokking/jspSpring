<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>정규표현식</title>
<script type="text/javascript">
	function checkForm() {
		var regExp = /Java/i;
		var str = document.frm.title.value;
		// str 문자열에서 java도 괜찮고 Jave도 괜찮으니 대소문자 가리지 말고 찾아보자
		var result = regExp.exec(str);
		
		console.log(result[0]);
	}
</script>
</head>
<body>
	<form name="frm">
		<p>제목 : <input type="text" name="title" /></p>
		<p><input type="button" value="전송" onclick="checkForm()" /></p>
	</form>
</body>
</html>