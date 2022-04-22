<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Form Processing</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

// 	String id = request.getParameter("id");
// 	String passwd = request.getParameter("passwd");
// 	String name = request.getParameter("name");
// 	String phone1 = request.getParameter("phone1");
// 	String phone2 = request.getParameter("phone2");
// 	String phone3 = request.getParameter("phone3");
// 	String gender = request.getParameter("gender");
// 	String[] hobby = request.getParameterValues("hobby");
// 	String comment = request.getParameter("comment");
// 	String city = request.getParameter("city");
%>
	<jsp:useBean id="member" class="dto.Member"/>
	<jsp:setProperty name="member" property="*"/>
	<p>아이디 : ${member.id}</p>
	<p>비밀번호 : ${member.passwd}</p>
	<p>이름 : ${member.name}</p>
	<p>연락처 : ${member.phone1}-${member.phone2}-${member.phone3}</p>
	<p>성별 : ${member.gender}</p>
	<p>취미 : 
		<c:forEach var="row" items="${member.hobby}">
			${row}
		</c:forEach>
	</p>
	<p>가입 인사 : ${member.comment}</p>
	<p>도시 : ${member.city}</p>
</body>
</html>