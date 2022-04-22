<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String memberId = (String)session.getAttribute("MEMBERID"); // ddit
	String name = (String)session.getAttribute("NAME"); // 개떵's
%>
<!DOCTYPE html>
<html>
<head>
<title>저장된 세션의 정보 확인</title>
</head>
<body>
	회원id : <%=memberId%><br />
	회원이름 : <%=name%><br />
	<a href="setMemberInfo.jsp">되돌아가기</a>
</body>
</html>