<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 세션의 고유 아이디를 가져옴
	String cartId = session.getId();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>장바구니</title>
</head>
<body>
<!-- top 인클루드 시작 -->
	<jsp:include page="/ch03/top.jsp"/>
<!-- top 인클루드 끝 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
						<a href="deleteCart.jsp?cartId=<%=cartId%>" 
						class="btn btn-danger">삭제하기</a>
					</td>
					<td align="right">
						<a href="shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 장바구니 목록 구현 시작 -->
	<div style="padding: 5%;">
		<table class="table table-hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
<%
	ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
// 	out.print("cartList 크기 : " + cartList.toString());
	// cartList : 장바구니
	if(cartList == null) {
		cartList = new ArrayList<Product>();
	}
	int sum = 0;
	for(int i = 0; i < cartList.size(); i++) {
		Product product = cartList.get(i);
		int total = product.getUniPrice() * product.getQuantity();
		// total을 누적
		sum = sum + total;
%>
			<tr>
				<td><%=product.getProductId()%> - <%=product.getPname()%></td>
				<td><%=product.getUniPrice()%></td>
				<td><%=product.getQuantity()%></td>
				<td><%=total%></td>
				<td>삭제</td>
			</tr>
<%
	}
%>
			<tr>
				<td></td>
				<td></td>
				<td>총액</td>
				<td><%=sum%></td>
				<td></td>
			</tr>
		</table>
		<a href="products.jsp" class="btn btn-secondary">&raquo; 쇼핑 계속하기</a>
	</div>
	<!-- 장바구니 목록 구현 끝 -->
<!-- bottom 인클루드 시작 -->
	<jsp:include page="/ch03/bottom.jsp"/>
<!-- bottom 인클루드 끝 -->
</body>
</html>