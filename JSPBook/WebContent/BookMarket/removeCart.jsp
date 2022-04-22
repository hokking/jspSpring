<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = request.getParameter("id");

	ArrayList<Book> cartList = (ArrayList<Book>)session.getAttribute("cartlist");
	//	out.print("cartList 크기 : " + cartList.toString());
	// cartList : 장바구니
	if(cartList == null) {
		cartList = new ArrayList<Book>();
	}
	
	for(int i = 0; i < cartList.size(); i++) {
		Book book = cartList.get(i);
		if(book.getBookId().equals(id)) {
			cartList.remove(i);
		}
	}
	response.sendRedirect("cart.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>

</body>
</html>