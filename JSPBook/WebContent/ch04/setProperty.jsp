<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
<!-- 
	* setProperty 액션 태그
	- useBean 액션 태그와 함께 사용됨
	- 자바빈즈 Setter() 메소드에 접근하여 자바빈즈의 멤버 변수인 프로퍼티의 값을 저장
-->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
<%
	person.setId(20192456);
	person.setName("손영흔");
%>
	<jsp:getProperty name="person" property="id"/>
	<jsp:setProperty name="person" property="id" value="20192456"/>
	<jsp:setProperty name="person" property="name" value="손영흔"/>
	<p>아이디 : ${person.id}</p>
	<p>이름 : ${person.name}</p>
	
</body>
</html>