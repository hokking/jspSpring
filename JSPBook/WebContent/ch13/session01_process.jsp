<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>
<%
	String user_id = request.getParameter("id");
	String user_pw = request.getParameter("passwd");
	
	if(user_id.equals("admin") && user_pw.equals("admin1234")) {
		session.setAttribute("userID", user_id);
		session.setAttribute("userPW", user_pw);
		out.print("세션 설정 성공<br />");
		out.print(user_id + "님 환영합니다");
	} else {
		out.print("세션 설정 실패");
	}
%>
</body>
</html>