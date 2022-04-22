<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="1kb" %>
<%@ page errorPage="/error/noParamEx.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버퍼 플러시 이후 예외 발생 결과</title>
</head>
<body>
<!-- 1KB를 초과하는 데이터를 출력하여 버퍼가 flush 되도록 해보자 -->
<%
	for (int i = 0; i < 256; i++) {
		out.print(i + "&nbsp;");
	}
%>
<!-- 자바에서 0으로 나누면 ArithmeticException 발생 -->
<%= 1/0 %>
</body>
</html>