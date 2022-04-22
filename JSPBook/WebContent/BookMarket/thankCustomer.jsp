<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Cookie[] cookies = request.getCookies();
	
	String shipping_cartId = "";
	String shipping_shippingDate = "";
	
	if(cookies != null) {
		for(int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if(n.equals("Shipping_cartId")) {
				shipping_cartId = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
			}
			if(n.equals("Shipping_shippingDate")) {
				shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>주문 완료</title>
</head>
<body>
<!-- top 인클루드 시작 -->
	<jsp:include page="/ch03/top.jsp"/>
<!-- top 인클루드 끝 -->

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은 <%=shipping_shippingDate%>에 배송될 예정입니다.</p>
		<p>주문번호 : <%=shipping_cartId%></p>
	</div>
	<div class="container">
		<p>
			<a href="books.jsp" class="btn btn-secondary">&laquo; 상품목록</a>
		</p>
	</div>

<!-- bottom 인클루드 시작 -->
	<jsp:include page="/ch03/bottom.jsp"/>
<!-- bottom 인클루드 끝 -->
</body>
</html>
<%
	// 세션으로 저장된 장바구니 정보를 모두 삭제함
	session.invalidate();

	// 쿠키에 저장된 배송 정보를 모두 삭제함
	for(int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		// 쿠키명 가져오기
		String n = thisCookie.getName();
		
		// 쿠키명에 매핑되어 있는 값을 가져오기
		if(n.equals("Shipping_cartId")) {
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_name")) {
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_shippingDate")) {
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_country")) {
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_zipCode")) {
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_addressName")) {
			thisCookie.setMaxAge(0);
		}
		
		response.addCookie(thisCookie);
	}
%>