<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Cookie</title>
</head>
<body>
<%
	// ?id=admin&passwd=1234
	String user_id = request.getParameter("id");
	String user_pw = request.getParameter("passwd");
	
	if(user_id.equals("admin") && user_pw.equals("1234")) {
		// Cookie 객체 생성
		Cookie cookie_id = new Cookie("userID", user_id);
		Cookie cookie_pw = new Cookie("userPW", user_pw);
		response.addCookie(cookie_id);
		response.addCookie(cookie_pw);
		
		out.print("쿠키 생성 성공!");
		out.print(user_id + "님 환영합니다.");
	} else {
		out.print("쿠키 생성 실패!");
	}
%>
</body>
</html>