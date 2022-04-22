<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>파라미터 출력</title>
</head>
<body>
<%
	try {
		// ?name=a001
		out.print(request.getParameter("name").toUpperCase());
	} catch (Exception e) {
		out.print("<img alt='500 오류 발생' src='/images/500.png' title='500 오류 발생'>");
	}
%>
</body>
</html>