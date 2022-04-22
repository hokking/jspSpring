package dto;

import java.io.Serializable;

public class Book implements Serializable {
	private static final long serialVersionUID = -4274708572038677000L;

	// 멤버변수
	private String bookId; 		// 도서코드
	private String bname; 		// 도서명
	private int uniPrice; 		// 도서 가격
	private String writer; 		// 저자
	private String publisher; 	// 출판사
	private String pdate; 		// 출판일
	private long pageCnt; 		// 총 페이지 수
	private String details; 	// 상세정보
	private String category; 	// 분류
	private long unitsInStock; 	// 재고수
	private String condition; 	// 상태
	private String fileName; 	// 이미지 파일명
	private int quantity;		// 장바구니에 담은 개수

	// 기본 생성자
	public Book() {
		super();
	}

	// 생성자(필수 : madatory 입력처리 / 선택 : optional)
	public Book(String bookId, String bname, int uniPrice) {
		super();
		this.bookId = bookId;
		this.bname = bname;
		this.uniPrice = uniPrice;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public int getUniPrice() {
		return uniPrice;
	}

	public void setUniPrice(int uniPrice) {
		this.uniPrice = uniPrice;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public long getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(long pageCnt) {
		this.pageCnt = pageCnt;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
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
		return "Book [bookId=" + bookId + ", bname=" + bname + ", uniPrice=" + uniPrice + ", writer=" + writer
				+ ", publisher=" + publisher + ", pdate=" + pdate + ", pageCnt=" + pageCnt + ", details=" + details
				+ ", category=" + category + ", unitsInStock=" + unitsInStock + ", condition=" + condition
				+ ", fileName=" + fileName + "]";
	}

}
