<%@page import="dto.Book"%>
<%@page import="ch04.com.dao.BookRepository"%>
<%@page import="ch04.com.dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<body>
<%-- 	<jsp:useBean id="productDAO" class="ch04.com.dao.ProductRepository" /> --%>
<%
	BookRepository bookDAO = BookRepository.getInstance();
%>
<!-- top.jsp include start -->
	<jsp:include page="/ch03/top.jsp"></jsp:include>
<!-- top.jsp include end -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
<%
	List<Book> listOfBooks = bookDAO.getAllBooks(); 
%>
	<div class="container">
		<div class="row" align="center">
		<!-- 상품 반복 시작 -->
<%
	for(int i = 0; i < listOfBooks.size(); i++) {
		Book book = listOfBooks.get(i);
%>
			<div class="col-md-2">
				<img src="/upload/<%=book.getFileName()%>" style="width: 100%" />
			</div>
			<div class="col-md-8" align="left">
				<h2><%=book.getBname()%></h2>
				<p><%=book.getDetails()%></p>
				<p><%=book.getUniPrice()%>원</p>
			</div>
			<div class="col-md-1">
				<p><a href="book.jsp?id=<%=book.getBookId()%>" class="btn btn-secondary" 
					role="button">상세 정보&raquo;</a></p>
			</div>
			
<%
	}
%>
		<!-- 상품 반복 끝 -->
		</div>
	</div>
<!-- bottom.jsp include start -->
	<jsp:include page="/ch03/bottom.jsp"></jsp:include>
<!-- bottom.jsp include end -->
</body>
</html>