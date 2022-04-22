<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
<!--  
	자바빈즈 Person의 property(멤버변수) id와 name의 값을 가져와 출력함
-->
	<jsp:useBean id="person" class="ch04.com.dao.Person" />
	<p>아이디 : ${person.id}</p>
	<p>이름 : ${person.name}</p>
	<p>아이디 : <jsp:getProperty name="person" property="id" /></p>
	<p>이름 : <jsp:getProperty name="person" property="name" /></p>
</body>
</html>