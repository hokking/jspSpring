<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css"/>  
<title>상품 아이디 오류</title>
</head>
<body>
	<!-- top 인클루드 시작 -->
	<jsp:include page="/ch03/top.jsp"/>
	<!-- top 인클루드 끝 -->
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h2>
		</div>
	</div>
	<!-- 
		request.getRequestURL() : 오류 발생 시 해당 오류 페이지 경로를 출력
		(http://localhost:8090/ch04/addProduct.jsp)
		request.getQueryString() : 요청 파라미터(productId=P1234)
		결과 : http://localhost:8090/ch04/addProduct.jsp?productId=P1234
	-->
	<div class="container">
		<p><%=request.getRequestURL()%>?<%=request.getQueryString()%></p>
		<p>
			<a href="/ch04/products.jsp" class="btn btn-secondary">
				상품목록 &raquo;
			</a>
		</p>
	</div>
	<!-- bottom 인클루드 시작 -->
	<jsp:include page="/ch03/bottom.jsp"/>
	<!-- bottom 인클루드 끝 -->
</body>
</html>