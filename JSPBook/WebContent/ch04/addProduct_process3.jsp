<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="dto.Product"%>
<%@page import="ch04.com.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 1. request 객체의 인코딩을 UTF-8로 설정
	request.setCharacterEncoding("utf-8");
	
	out.print("aaa");
	// 2. parameter 목록을 받자
	String productId = request.getParameter("productId");
	out.print(productId);
	String pname = request.getParameter("pname");
	String uniPrice = request.getParameter("uniPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
	Integer price;
	if (uniPrice.isEmpty()) {
		price = 0;
	} else {
		price = Integer.valueOf(uniPrice);
	}
	
	long stock;
	if (unitsInStock.isEmpty()) {
		stock = 0;
	} else {
		stock = Long.valueOf(unitsInStock);
	}
	
	// 3-1. ProductRespository 클래스의 인스턴스 생성
	ProductRepository dao = ProductRepository.getInstance();
	// 상품 객체(신규 상품을 등록하기 위해 빈그릇 준비 자바빈 클래스)
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(pname);
	newProduct.setUniPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	
	out.print("newProduct : " + newProduct.toString());
	
	// 3-2. 파일 업로드 처리
	// 파일 저장 임시 경로 & 실제로 저장될 위치
	String path = "D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\JSPBook\\WebContent\\upload";
	// DiskFileUpload 클래스 (common-fileupload 라이브러리에서 제공)
	DiskFileUpload uplaod = new DiskFileUpload();
	// 5M까지 업로드 가능
	uplaod.setSizeMax(5000000);
	// 버퍼 메모리 4Kbytes
	uplaod.setSizeThreshold(4096);
	// 임시 저장 경로
	uplaod.setRepositoryPath(path);
	
	// upload객체가 jsp 기본 객체인 request 객체에 담긴 파라미터 데이터들을 파싱(구문 + 의미분석) - 목록화
	List items = uplaod.parseRequest(request);
	// List를 Iterator로 바꿔줌
	Iterator params = items.iterator();
	
	while (params.hasNext()) {
		FileItem item = (FileItem)params.next();
		if (item.isFormField()) {
			String name = item.getFieldName();
			String value = item.getString("utf-8");
		} else {
			//productImage
			String fileFieldName = item.getFieldName();
			//실제 파일명
			String fileName = item.getName();
			//파일의 MIME 타입
			String contentType = item.getContentType();
			//물리경로 -> 파일명만 남김
			fileName.substring(fileName.lastIndexOf("\\") + 1);
			//파일 저장을 위한 설계(파일객체)
			File file = new File(path + "/" + fileName);
			//파일 저장
			item.write(file);
			//결과 출력
			out.print("저장 파일 이름 : " + fileName + "<br />");
			//상품 객체의 filename 멤버 변수에 파일명을 세팅
			newProduct.setFileName(fileName);
		}
	}
	
	
	// 4. 상품 추가
	dao.addProduct(newProduct);
	
	// 5. products.jsp(상품 목록)로 돌아가기
	response.sendRedirect("products.jsp");
%>