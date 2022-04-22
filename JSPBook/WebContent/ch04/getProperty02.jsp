<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
<!--  
	useBean 액션 태그의 id 속성값(person)을 통해 
	자바빈즈 Person의 property id와 name에 값을 저장하고 
	자바빈즈 Person의 property id와 name에 값을 가져와 화면 출력함
-->
	<jsp:useBean id="person" class="ch04.com.dao.Person" />
	<jsp:setProperty property="id" name="person" value="20220106"/>
	<jsp:setProperty property="name" name="person" value="이선우"/>
	<p>아이디 : <jsp:getProperty property="id" name="person"/></p>
	<p>이름 : <jsp:getProperty property="name" name="person"/></p>
</body>
</html>