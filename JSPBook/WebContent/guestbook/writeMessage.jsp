<%@page import="guestbook.service.WriteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>방명록 메시지 남김</title>
</head>
<body>
	<jsp:useBean id="guestbookMessage" class="dto.GuestbookMessage">
		<jsp:setProperty name="guestbookMessage" property="*" />
	</jsp:useBean>
	${guestbookMessage.messageId}<br />
	${guestbookMessage.guestName}<br />
	${guestbookMessage.password}<br />
	${guestbookMessage.message}<br />
	<%
		WriteMessageService writeMessageService = 
					WriteMessageService.getInstance();
		writeMessageService.write(guestbookMessage);
	%>
	방명록에 메시지를 남겼습니다.<br />
	<a href="list.jsp">[목록보기]</a>
</body>
</html>