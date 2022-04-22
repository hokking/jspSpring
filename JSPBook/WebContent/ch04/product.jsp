<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dto.Product"%>
<%@ page import="ch04.com.dao.ProductRepository"%>
<%@ page errorPage="/exceptionNoProductId.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" 
	href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<title>상품 상세 정보</title>
<script>
	function addToCart() {
		// 확인 : true, 취소 : false
		if(confirm("상품을 장바구니에 추가하겠습니까?")){ 	// 화인
			document.addForm.submit();
		} else {								// 취소
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
<%--
	객체를 새로 만들기 때문에 이걸로 사용하지 않는다
	<jsp:useBean id="productDAO" class="ch04.com.dao.ProductRepository" /> 
--%>
<%
	// 객체를 서로 공유해서 사용
	ProductRepository productDAO = ProductRepository.getInstance();
%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
<%
	// product.jsp?id=P1234
	String id = request.getParameter("id");
// 	out.print("id : " + id + "<br/>");
	
	Product product = productDAO.getProductById(id);
	
	// null.toString() -> 오류 임의 발생(errorPage 발생 유도)
	product.toString();
%>
	<c:set var="product" value="<%=product%>" />
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="/upload/${product.fileName}" style="width: 100%;" />
			</div>
			<div class="col-md-6">
				<h3>${product.pname}</h3>
				<p>${product.description}</p>
				<p>
					<b>상품 코드 : </b>
					<span class="badge badge-danger">${product.productId}</span>
				</p>
				<p><b>제조사</b> : ${product.manufacturer}</p>
				<p><b>분류</b> : ${product.category}</p>
				<p><b>재고 수</b> : ${product.unitsInStock}</p>
				<h4>${product.uniPrice}원</h4>
				<p>
					<form name="addForm" method="post" action="addCart.jsp?id=${product.productId}">
						<a href="#" class="btn btn-info" onclick="addToCart()">상품주문 &raquo;	</a>
						<a href="cart.jsp" class="btn btn-warning">장바구니 &raquo;	</a>
						<a href="products.jsp" class="btn btn-secondary">상품목록 &raquo;</a>
					</form>
				</p>
			</div>
		</div>
	</div>
</body>
</html>