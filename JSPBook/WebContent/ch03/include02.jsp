<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
<%@ include file="/ch03/include02_header.jsp" %>
	<p><b>다음달 태영이의 생일을 미리 축하합니다.</b></p>
<%
	for(int i = 0; i < 9; i++) {
		if(i % 2 == 0) {
			out.print(i * 7 + "<br>");
		}
	}
%>
	
<%@ include file="/ch03/include02_footer.jsp" %>
</body>
</html>