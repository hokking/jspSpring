package ch04.com.dao;

import java.util.ArrayList;
import java.util.List;

import dto.Book;
import dto.Product;

// 자바빈즈로 사용할 상품 데이터 접근 클래스
public class BookRepository {
	private List<Book> listOfBooks = new ArrayList<Book>();
	
	// 싱글톤 패턴 : 객체를 단 한번 만들어 공유해서 사용함
	private static BookRepository instance = new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}
	
	// 생성자
	public BookRepository() {
		Book novel = new Book("B1234", "불편한 편의점", 13000);
		novel.setWriter("김호연");
		novel.setPublisher("나무옆의자");
		novel.setPdate("2021-04-20");
		novel.setPageCnt(268);
		novel.setDetails("불편한데 자꾸 가고 싶은 편의점이 있다!\r\n" + 
				"힘들게 살아낸 오늘을 위로하는 편의점의 밤\r\n" + 
				"정체불명의 알바로부터 시작된 웃음과 감동의 나비효과\r\n" + 
				"『망원동 브라더스』 김호연의 ‘동네 이야기’ 시즌 2");
		novel.setCategory("소설");
		novel.setUnitsInStock(50);
		novel.setCondition("New");
		novel.setFileName("B1234.jfif");

		Book management = new Book("B1234", "불편한 편의점", 13000);
		management.setWriter("김난도, 전미영, 최지혜, 이향은, 이준영 저 외 6명");
		management.setPublisher("미래의창");
		management.setPdate("2021-10-06");
		management.setPageCnt(456);
		management.setDetails("대한민국 대표 트렌드서로 자리매김한 『트렌드 코리아 2022』는 2021년 트렌드 상품을 선정해 소비자의 니즈를 분석하고, 2022년 비즈니스 시장을 예측한다. ‘바른생활 루틴이’, ‘러스틱 라이프’ 등 읽으면 읽을수록 공감되고 재미있는 트렌드 키워드 10가지를 제시한다.");
		management.setCategory("경제");
		management.setUnitsInStock(30);
		management.setCondition("Old");
		management.setFileName("B1235.jfif");
		
		
		
		// List<Product> 객체 타입의 변수에 저장
		listOfBooks.add(novel);
		listOfBooks.add(management);

	}
	
	// 객체 타입의 변수 listOfProducts에 저장된 모든 상품 목록을 가져옴
	// SELECT * FROM PROD;
	public List<Book> getAllBooks() {
		return listOfBooks;
	}
	
	// 상품 상세 정보를 가져오는 메소드
	// SELECT * FROM PROD WHERE PROD_ID = 'P101000001";
	public Book getBookById(String bookId) {
		Book bookById = null;
		// listOfProducts.size() : 3건(phone, noteboot, tablet)
		// List<Product> listOfProducts
		for(int i = 0; i < listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
			// 등록된 상품이 있어야 하고, 상품 코드가 있어야하며, 
			// 그때의 그 상품코드와 매개변수에 담긴 파라미터 상품코드가 같을 때에만 실행
			if(book != null && book.getBookId() != null
					&& book.getBookId().equals(bookId)) {
				bookById = book;
				break;
			}
		}
		return bookById;
	}
	
	// 상품 추가
	public void addBook(Book book) {
//		private List<Product> listOfProducts = new ArrayList<Product>();
		listOfBooks.add(book);
	}
}
