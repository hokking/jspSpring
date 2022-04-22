<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
</head>
<body>
	<h3>입력에 성공했습니다</h3>
<%
	request.setCharacterEncoding("utf-8");
	// 파라미터 목록 중 id와 passwd라는 name에 매핑되어 있는 value를 get함
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
%>
	<p>아이디 : <%=id%></p>
	<p>비밀번호 : ${param.passwd}</p>
</body>
</html>