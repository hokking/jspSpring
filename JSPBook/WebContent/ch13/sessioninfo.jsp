<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>세션 정보</title>
</head>
<body>
<%
	// long 타입의 시간 값을 저장하기 위해 사용
	Date time = new Date();

	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
	세션ID : <%=session.getId()%><br />
<%
	// 세션의 생성 시간을 Date 객체인 time에 저장
	time.setTime(session.getCreationTime());
%>
	세션생성시간 : <%=formatter.format(time)%><br />
<%
	// 세션의 마지막 접근 시간(long) -> Date 타입으로 세팅
	time.setTime(session.getLastAccessedTime());
%>
	최근접근시간 : <%=formatter.format(time)%>
</body>
</html>