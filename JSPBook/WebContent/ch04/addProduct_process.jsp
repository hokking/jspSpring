<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page import="dto.Product"%>
<%@ page import="ch04.com.dao.ProductRepository"%>
<%
//1. request객체의 인코딩을 UTF-8로 설정
	request.setCharacterEncoding("UTF-8");

//0 파일 업로드 처리(productImage)
	String path = "D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\JSPBook\\WebContent\\upload";
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(5000000);
	upload.setSizeThreshold(4096);
	upload.setRepositoryPath(path);
	
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	Product newProduct = new Product();
	String productId = "";
	String pname = "";
	String uniPrice = "";
	String description = "";
	String manufacturer = "";
	String category = "";
	String unitsInStock = "";
	String condition = "";
	
	while(params.hasNext()){
		FileItem item = (FileItem)params.next();
		
		if(item.isFormField()){
			//input type='text' name='productId' => productId
			String name = item.getFieldName();
			
			if(name.equals("productId")){
				productId = item.getString("UTF-8");
			}else if(name.equals("pname")){
				pname = item.getString("UTF-8");
			}else if(name.equals("uniPrice")){
				uniPrice = item.getString("UTF-8");
			}else if(name.equals("description")){
				description = item.getString("UTF-8");
			}else if(name.equals("manufacturer")){
				manufacturer = item.getString("UTF-8");
			}else if(name.equals("category")){
				category = item.getString("UTF-8");
			}else if(name.equals("unitsInStock")){
				unitsInStock = item.getString("UTF-8");
			}else if(name.equals("condition")){
				condition = item.getString("UTF-8");
			}
		}else{
			//productImage
			String fileFieldName = item.getFieldName();
			//실제 파일명
			String fileName = item.getName();
			//파일의 MIME 타입
			String contentType = item.getContentType();
			//물리경로 -> 파일명만 남김
			fileName.substring(fileName.lastIndexOf("\\")+1);
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

//2. 파라미터 목록을 받자
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
	
//3. ProductRespository 클래스의 인스턴스 생성
	ProductRepository dao = ProductRepository.getInstance();
	
	newProduct.setProductId(productId);
	newProduct.setPname(pname);
	newProduct.setUniPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	
	out.print("newProduct : " + newProduct.toString());
	


//4. 상품을 추가하자
	// 	public void addProduct(Product product) {
	dao.addProduct(newProduct);


//5. 상품 목록(products.jsp)으로 돌아가자.
	response.sendRedirect("products.jsp");
%>
