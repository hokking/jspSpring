<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");

	// 파라미터 목록 중에서 memberId 및 name을 get함
	String memberId = request.getParameter("memberId");
	String name = request.getParameter("name");
	
// 	out.print("memId : " + memberId + ", name : " + name);
	
	// jdbc 드라이버 로딩/메모리에 올림
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	// 변경된 건수
	int updateCount = 0;
	
	// 커넥션 객체 선언
	Connection conn = null;
	// Statement 객체 선언
	Statement stmt = null;
	String sql = "UPDATE MEMBER SET NAME = '" + name 
			+ "' WHERE MEMBERID = '" + memberId + "'";
	try {
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbUser = "jspexam";
		String dbPass = "java";
		// 커넥션 객체 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// Statement 객체 생성
		stmt = conn.createStatement();
		// insert, update, delete -> executeUpdate
		// select -> executeQuery
		updateCount = stmt.executeUpdate(sql);
	} catch(SQLException e) {
		out.print(e.getMessage());
	} finally {
		if(stmt!=null)try{stmt.close();} catch(SQLException e){}
		if(conn!=null)try{conn.close();} catch(SQLException e){}
	}
	
	if(updateCount > 0) {
		out.print(memberId + "의 이름을 " + name + "(으)로 변경");
	} else {
		out.print(memberId + " 아이디가 없음");
	}
%>