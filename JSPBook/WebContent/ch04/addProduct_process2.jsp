<%@page import="dto.Product"%>
<%@page import="ch04.com.dao.ProductRepository"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>cos.jar를 통한 파일 업로드</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 웰 어플리케이션상의 절대경로
	String realFolder = "D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\JSPBook\\WebContent\\upload";
	
	String filename = "";
	// 최대 업로드 될 파일의 크기 5MB
	int maxSize = 5*1024*1024;
	
	// 인코딩 유형
	String encType = "UTF-8";
	
	// cos.jar 라이브러리의 핵심 클래스
	MultipartRequest multi = new MultipartRequest(
				request, 
				realFolder, 
				maxSize, 
				encType, 
				new DefaultFileRenamePolicy()
			);
	// form 데이터 처리
	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String uniPrice = multi.getParameter("uniPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	
	Integer price;	
	if(uniPrice.isEmpty()){
		price = 0;	
	}else{
		price = Integer.valueOf(uniPrice);
	}
	
	long stock;
	if(unitsInStock.isEmpty()){
		stock = 0;
	}else{
		stock = Long.valueOf(unitsInStock);
	}
	
	// 파일 객체 처리
	// multi객체 안에는 request 객체가 들어있고, request객체 안에는 파일 객체가 있음
	Enumeration files = multi.getFileNames();
	// productImage2
	String fname = (String)files.nextElement();
	// 폼 페이지에서 전송되어 서버에 업로드된 파일을 가져옴
	// P1237.jpg
	String fileName = multi.getFilesystemName(fname);
	
	out.print("fname : " + fname + ", fileName : " + fileName);
	
	// 싱글톤패턴
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = new Product();
	product.setProductId(productId);
	product.setPname(pname);
	product.setUniPrice(price);
	product.setDescription(description);
	product.setManufacturer(manufacturer);
	product.setCategory(category);
	product.setUnitsInStock(stock);
	product.setCondition(condition);
	// 파일 객체 파일명(fileName : P1237.jpg)
	product.setFileName(fileName);
	
	// dao : data access object(여기서는 메모리 DB라고 생각)
	dao.addProduct(product);
	
	// 상품 목록으로 리다이렉트
	response.sendRedirect("products.jsp");
%>
</body>
</html>