<%@page import="dto.Book"%>
<%@page import="ch04.com.dao.BookRepository"%>
<%@page import="ch04.com.dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	BookRepository bookDAO = BookRepository.getInstance();
%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
<%
	// product.jsp?id=P1234
	String id = request.getParameter("id");
// 	out.print("id : " + id + "<br/>");
	
	Book book = bookDAO.getBookById(id);
	
	book.toString();
%>
	<c:set var="book" value="<%=book%>" />
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="/upload/${book.fileName}" style="width: 100%;" />
			</div>
			<div class="col-md-6">
				<h3>${book.bname}</h3>
				<p>${book.details}</p>
				<p>
					<b>상품 코드 : </b>
					<span class="badge badge-danger">${book.bookId}</span>
				</p>
				<p><b>출판사</b> : ${book.publisher}</p>
				<p><b>출판일</b> : ${book.pdate}</p>
				<p><b>총 페이지</b> : ${book.pageCnt}</p>
				<p><b>재고수</b> : ${book.unitsInStock}</p>
				<h4>${book.uniPrice}원</h4>
				<p>
					<form name="addForm" method="post" action="addCart.jsp?id=${book.bookId}">
						<a href="#" class="btn btn-info" onclick="addToCart()">도서 주문&raquo;</a>
						<a href="cart.jsp?id=${book.bookId}" class="btn btn-warning">장바구니 &raquo;	</a>
						<a href="books.jsp" class="btn btn-secondary">도서 목록&raquo;</a>
					</form>
				</p>
			</div>
		</div>
	</div>
</body>
</html>