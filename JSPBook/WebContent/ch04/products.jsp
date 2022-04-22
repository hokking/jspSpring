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
	ProductRepository productDAO = ProductRepository.getInstance();
%>
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
	<div class="container">
		<div class="row" align="center">
		<!-- 상품 반복 시작 -->
<%
	for(int i = 0; i < listOfProducts.size(); i++) {
		Product product = listOfProducts.get(i);
%>
			<div class="col-md-4">
				<img src="/upload/<%=product.getFileName()%>" style="width: 100%" />
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%></p>
				<p><%=product.getUniPrice()%>원</p>
				<p><a href="product.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" 
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