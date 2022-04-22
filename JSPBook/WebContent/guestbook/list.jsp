<%@page import="dto.GuestbookMessage"%>
<%@page import="java.util.List"%>
<%@page import="guestbook.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// list.jsp에서 사용할
	// 메시지 목록(List<GuestbookMessage>)을 가져와주는 서비스 로직
	GetMessageListService messageListService = 
				GetMessageListService.getInstace();
	List<GuestbookMessage> list = messageListService.getMessageList();
%>
<c:set var="list" value="<%=list %>" />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<title>방명록 메시지 목록</title>
<script type="text/javascript">
	$(function() {
// 		alert("왔다.");
	});
	
	// fn_updt(기본키, 작성자, 메시지)
	function fn_updt(vara, varb, varc) {
// 		alert(vara);
		// 기본키 데이터를 vara 매개변수로 받아서 frmUpdate 폼의 기본키 데이터로 사용
		$("#messageId").val(vara);
		// 작성자 매개변수를 frmUpdate 폼의 이름 데이터로 사용
		$("#guestName").val(varb);
		// 메시지 매개변수를 frmUpdate 폼의 내용 데이터로 사용
		$("#message").text(varc);
		$('#frmWrite').css("display", "none");
		$('#frmUpdate').css("display", "block");
	}
</script>
</head>
<body>
	<form id="frmWrite" method="post" action="writeMessage.jsp" style="display: block;">
		이름 : <input type="text" name="guestName" /><br />
		비밀번호 : <input type="password" name="password" /><br />
		내용 : <textarea rows="3" cols="30" name="message"></textarea>
		<input type="submit" value="메시지 남기기" />
	</form>
	<form id="frmUpdate" method="post" action="updateMessage.jsp" style="display: none;">
		<input type="hidden" name="messageId" id="messageId" />
		이름 : <input type="text" name="guestName" id="guestName" /><br />
		비밀번호 : <input type="password" name="password" /><br />
		내용 : <textarea rows="3" cols="30" name="message" id="message"></textarea>
		<input type="submit" value="확인" />&nbsp;
		<input type="button" value="취소" onclick="javascript:location.href='list.jsp';" />
	</form>
	<hr />
	<!-- 
		[수정]
		1. 클릭 시 상단의 폼에 정보가 입력되고(비밀번호 제외)
			"메시지 남기기"버튼이 hidden, "확인" 및 "취소" 버튼이 block
		2. "확인" 클릭 시 해당 정보가 업데이트 되는데, 이 때 비밀번호가 일치해야 함
		3. "취소" 클릭 시 현재 페이지의 목록으로 되돌아감
			"메시지 남기기" 버튼이 block, "확인" 및 "취소" 버튼이 hidden
	-->
	<c:if test="${param.result eq 1}">
		<div style="color:red;">변경 성공했습니다.</div>
	</c:if>
	<c:if test="${param.result < 1}">
		<div style="color:red;">비밀번호를 확인해주세요.</div>
	</c:if>
	<table border="1">
	<c:forEach var="message" items="${list}">
		<tr>
			<td>
				메시지 번호 : <span>${message.messageId}</span><br />
				손 님  이 름 : <span>${message.guestName}</span><br />
				메    시   지 : <span>${message.message}</span><br />
				<a href="#" id="updt" onclick="fn_updt('${message.messageId}','${message.guestName}','${message.message}')">[수정]</a>&nbsp;
				<a href="deleteMessage.jsp?messageId=${message.messageId}">[삭제]</a>
			</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>