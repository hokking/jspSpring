<%@page import="guestbook.service.ServiceException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dto.GuestbookMessage"%>
<%@page import="guestbook.service.DeleteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	String messageId = request.getParameter("messageId");
	
	GuestbookMessage message = new GuestbookMessage();
	message.setMessageId(Integer.parseInt(messageId));
	
	// 삭제 성공 여부(성공으로 세팅)
	boolean result = true;
	// 삭제된 건수
	int cnt = 0;
	try {
		DeleteMessageService service = DeleteMessageService.getInstance();
		cnt = service.delete(message);
	} catch(ServiceException e) {
		// 실패처리
		result = false;
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>방명록 메시지 삭제</title>
</head>
<body>
<%
	if(result) { // true
		if(cnt > 0){ // 삭제가 잘 된 경우
			out.print("메시지를 삭제하였습니다.");
		} else { // 기본키에 해당되는 데이터가 없을 경우
			out.print("해당 데이터가 없습니다.");
		}
	} else { // false
		out.print("삭제가 되지 않았습니다.");
		
	}
%>
	<br />
	<a href="list.jsp">[목록 보기]</a>
</body>
</html>