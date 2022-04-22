<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
	<p>아이디 : <%= person.getId() %></p>
	<p>이름 : <%= person.getName() %></p>
<%
	person.setId(20175826); // 아이디에 새로운 값을 넣어줌
	person.setName("손영흔"); // name 필드에 새로운 값을 넣어줌
%>
	<jsp:include page="useBean03.jsp" />
</body>
</html>