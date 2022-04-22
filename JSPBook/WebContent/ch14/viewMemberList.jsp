<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>
</head>
<body>
MEMBER 테이블의 내용<br />
	<table width="100%" border="1">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
		</tr>
<%
	// 1. JDBC 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		// 2. 데이터베이스 커넥션(연결객체) 생성
		// 1) jdbcDriver? 2) 계정 아이디? 3) 비밀번호?
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbUser = "jspexam";
		String dbPass = "java";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// 3. Statement 생성
		stmt = conn.createStatement();
		
		// 4. 쿼리 실행
		String sql = "SELECT MEMBERID, PASSWORD, NAME, EMAIL FROM MEMBER";
		rs = stmt.executeQuery(sql);
		
		// 5. 쿼리 실행 결과 화면 출력
		while(rs.next()) {
			out.print("<tr>");
			out.print("<td><a href='viewMember.jsp?memberId="+rs.getString("MEMBERID") + "'>" + rs.getString("NAME") + "</a></td>");
			out.print("<td>" + rs.getString("MEMBERID") + "</td>");
			out.print("<td>" + rs.getString("EMAIL") + "</td>");
			out.print("</tr>");
		}
		
	} catch(SQLException e) {
		out.print(e.getMessage());
		e.printStackTrace();
	} finally {
		// 6. 사용한 Statement객체 종료
		if(rs!=null)try{rs.close();} catch(SQLException e){}
		if(stmt!=null)try{stmt.close();} catch(SQLException e){}
		
		// 7. 커넥션 객체 종료
		if(conn!=null)try{conn.close();} catch(SQLException e){}
	}
%>
	</table>
</body>
</html>