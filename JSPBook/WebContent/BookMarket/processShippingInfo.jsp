<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 쿠키 생성 문법?
	// Cookie 객체명 = new Cookie(name, value);
	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId")));
	Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name")));
	Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate")));
	Cookie country = new Cookie("Shipping_country", URLEncoder.encode(request.getParameter("country")));
	Cookie zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode")));
	Cookie addressName = new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName")));
	
	// 생성한 쿠키의 유효 기간을 24시간으로 설정
	cartId.setMaxAge(24*60*60);
	name.setMaxAge(24*60*60);
	shippingDate.setMaxAge(24*60*60);
	country.setMaxAge(24*60*60);
	zipCode.setMaxAge(24*60*60);
	addressName.setMaxAge(24*60*60);
	
	// 쿠키를 등록하기 위해 response객체를 통해 클라이언트(크롬)에게 전달해 줌
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);
	
	response.sendRedirect("orderConfirmation.jsp");
%>