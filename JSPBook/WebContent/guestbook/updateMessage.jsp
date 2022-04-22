<%@page import="dto.GuestbookMessage"%>
<%@page import="guestbook.service.UpdateMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");

	String messageId = request.getParameter("messageId");
	String guestName = request.getParameter("guestName");
	String password = request.getParameter("password");
	String message = request.getParameter("message");

// 	out.print("messageId : " + messageId + "<br />");
// 	out.print("guestName : " + guestName + "<br />");
// 	out.print("password : " + password + "<br />");
// 	out.print("message : " + message + "<br />");
	
	GuestbookMessage guestbookMessage = 
			new GuestbookMessage(Integer.parseInt(messageId), guestName, password, message);
	
	// 여기서 사용할  UpdateMessageService의 객체를 생성
	UpdateMessageService service = UpdateMessageService.getInstance();
	
	int result = service.update(guestbookMessage);
	if(result > 0) { // 변경 성공
		out.print("<script type='text/javascript'>location.href='list.jsp?result=1'</script>");
	} else { // 변경 실패
		out.print("<script type='text/javascript'>location.href='list.jsp?result=0'</script>");
	}
%>