<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<c:if test="${sessionScope.memId==null}">
		<jsp:forward page="/welcome.jsp" />
	</c:if>

	<h2>forward Action Tag</h2>
	<h4>?type=1(날짜)</h4>
	<c:if test="${param.type=='1'}">
		<jsp:forward page="second.jsp" />
	</c:if>
	
	<h4>?type=2(날짜/시간)</h4>
	<c:if test="${param.type=='2'}">
		<jsp:forward page="forward_date.jsp" />
	</c:if>
	<p>--------------------------------</p>
</body>
</html>