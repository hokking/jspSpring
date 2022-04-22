package dto;

import java.io.Serializable;

/*
	Serializable : 자바 직렬화
	자바 시스템 내부/외부 서로 객체 또는 데이터를 공유할 수 있도록 
	바이트(byte) 형태로 데이터를 변환하고 
	반대로 다시 바이트 형태의 데이터를 객체 또는 데이터로 변환(역직렬화)하는 기술 
 */
public class Product implements Serializable {
	private static final long serialVersionUID = -4274708572038677000L;

	// 멤버변수
	private String productId; 		// 상품 아이디
	private String pname; 			// 상품명
	private int uniPrice; 			// 상품 가격
	private String description; 	// 상품설명
	private String manufacturer; 	// 제조사
	private String category; 		// 분류
	private long unitsInStock; 		// 재고 수
	private String condition; 		// 신상품 / 중고품 / 재생품
	private String fileName;		// 이미지 파일명
	private int quantity;			// 장바구니에 담은 개수

	// 기본 생성자
	public Product() {
		super();
	}

	// 생성자(필수 : madatory 입력처리 / 선택 : optional)
	public Product(String productId, String pname, int uniPrice) {
		super();
		this.productId = productId;
		this.pname = pname;
		this.uniPrice = uniPrice;
	}

	// getter / setter 메소드
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getUniPrice() {
		return uniPrice;
	}

	public void setUniPrice(int uniPrice) {
		this.uniPrice = uniPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", pname=" + pname + ", uniPrice=" + uniPrice + ", description="
				+ description + ", manufacturer=" + manufacturer + ", category=" + category + ", unitsInStock="
				+ unitsInStock + ", condition=" + condition + ", fileName=" + fileName + "]";
	}


}
