<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");

	String memberid = request.getParameter("memberid");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	int insertCnt = 0;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe", 
				"jspexam", "java");
		pstmt = conn.prepareStatement(
				"INSERT INTO MEMBER(MEMBERID, PASSWORD, NAME, EMAIL)"
						+ "VALUES(?, ?, ?, ?)"
				);
		pstmt.setString(1, memberid);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, email);

		insertCnt = pstmt.executeUpdate();
		
	} catch(SQLException e) {
		out.print(e.getMessage());
	} finally {
		if(pstmt!=null)try{pstmt.close();} catch(SQLException e){}
		if(conn!=null)try{conn.close();} catch(SQLException e){}
	}
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%
	if(insertCnt > 0) {
		out.print("<h2>새로운 객체가 생성되었습니다</h2>");
	} else {
		out.print("<h2>새로운 객체가 생성되지 않았습니다</h2>");
	}
%>
</body>
</html>