<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
		
		if(user_id.equals("admin") && user_pw.equals("admin1234")){
			session.setAttribute("userID", user_id);
			response.sendRedirect("welcome.jsp");
		} else {
			response.sendRedirect("session.jsp");
		}
	%>
</body>
</html>





