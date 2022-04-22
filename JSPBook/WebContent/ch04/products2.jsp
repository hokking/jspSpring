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
	<jsp:useBean id="productDAO" class="ch04.com.dao.ProductRepository" />
<!-- top.jsp include start -->
	<jsp:include page="/ch03/top.jsp"></jsp:include>
<!-- top.jsp include end -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
<%
	List<Product> listOfProducts = productDAO.getAllProducts(); 
%>
	<c:set var="listOfProducts" value="<%= listOfProducts %>" />
	<div class="container">
		<div class="row" align="center">
		<!-- 상품 반복 시작 -->
			<c:forEach var="products" items="${listOfProducts}">
				<div class="col-md-4">
					<h3>${products.pname}</h3>
					<p>${products.description}</p>
					<p>${products.uniPrice}</p>
				</div>
			</c:forEach>
		<!-- 상품 반복 끝 -->
		</div>
	</div>
<!-- bottom.jsp include start -->
	<jsp:include page="/ch03/bottom.jsp"></jsp:include>
<!-- bottom.jsp include end -->
</body>
</html>