<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.Product"%>
<%@page import="ch04.com.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = request.getParameter("id");
	// id가 없거나 값이 없을 때
	if(id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}
	
	// 상품 저장소 객체 생성
	ProductRepository dao = ProductRepository.getInstance();
	
	// 상품 아이디에 해당하는 정보 얻기
	Product product = dao.getProductById(id);
	
	// id값이 P9999 이런 경우 상품이 없다
	if(product == null) {
		response.sendRedirect("/exceptionNoProductId.jsp");
	}
	
	// 모든 상품 가져오기
	List<Product> goodsList = dao.getAllProducts();
	Product goods = new Product();
	// 요청 파라미터 아이디의 상품이 존재하는지 검사
	for(int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if(goods.getProductId().equals(id)) {
			// for문에서 벗어나
			break;
		}
	}
	
	// *요청 파라미터 아이디의 상품을 담은 장바구니를 초기화
	// 세션 : cartlist 를 얻어와 ArrayList 객체에 저장
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	out.print("list의 크기 : " + list);
	// 만약 cartlist라는 세션 정보가 없다면 ArrayList객체를 생성하고 cartlist세션 생성
	if(list == null) {
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}
	
	// list : 장바구니에 담긴 상품 목록
	int cnt = 0;
	Product goodsQnt = new Product();
	for(int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		// 요청 파라미터 아이디 addCart.jsp?id=P1234의 상품이 장바구니에 담긴 목록에 있다면
		// 해당 상품의 수량을 1증가
		if(goodsQnt.getProductId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	// 요청 파라미터 아이디 addCart.jsp?id=P1234의 상품이  장바구니에 담긴 목록에 없다면
	// 해당 상품의 수량을 1로 처리
	if(cnt == 0) {
		goods.setQuantity(1);
		list.add(goods);
	}
	response.sendRedirect("product.jsp?id=" + id);
	
	
%>