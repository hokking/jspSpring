<%@page import="jdbc.ConnectionProvider"%>
<%@page import="jdbc.JdbcUtil"%>
<%@page import="dto.Mem"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String memberId = request.getParameter("memberId");
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	Mem memVO = null;
	
	String sql = "SELECT MEMBERID, PASSWORD, NAME, EMAIL FROM MEMBER "
			+ "WHERE MEMBERID = '" + memberId + "'";

	try {
		conn = ConnectionProvider.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			memVO = new Mem();
			memVO.setMemberid(rs.getString("MEMBERID"));
			memVO.setPassword(rs.getString("PASSWORD"));
			memVO.setName(rs.getString("NAME"));
			memVO.setEmail(rs.getString("EMAIL"));
		}
// 		out.print("memVo : " + memVO.toString());
		
	} catch(SQLException e) {
		out.print(e.getMessage());
	} finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(stmt);
		JdbcUtil.close(conn);
	}
%>
	<c:set var="memVO" value="<%=memVO%>" />
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>${memVO.memberid}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>${memVO.password}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${memVO.name}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${memVO.email}</td>
		</tr>
	</table>
</body>
</html>