package ch04.com.dao;

import java.util.ArrayList;
import java.util.List;

import dto.Product;

// 자바빈즈로 사용할 상품 데이터 접근 클래스
public class ProductRepository {
	private List<Product> listOfProducts = new ArrayList<Product>();
	
	// 싱글톤 패턴 : 객체를 단 한번 만들어 공유해서 사용함
	private static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	// 생성자
	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 13", 900000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFileName("P1234.jpg");
		
		Product noteBook = new Product("P1235", "LG PC gram", 1500000);
		noteBook.setDescription("13.3-inch, IPS LED display, 5th Generation");
		noteBook.setCategory("Notebook");
		noteBook.setManufacturer("LG");
		noteBook.setUnitsInStock(1);
		noteBook.setCondition("Refurblished");
		noteBook.setFileName("P1235.jpg");
		
		Product tablet = new Product("P1236", "Galaxy Tab S", 950000);
		tablet.setDescription("212.8*125.6*6.6mm, Super ANOLED display");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(100);
		tablet.setCondition("Old");
		tablet.setFileName("P1236.jpg");
		
		// List<Product> 객체 타입의 변수에 저장
		listOfProducts.add(phone);
		listOfProducts.add(noteBook);
		listOfProducts.add(tablet);

	}
	
	// 객체 타입의 변수 listOfProducts에 저장된 모든 상품 목록을 가져옴
	// SELECT * FROM PROD;
	public List<Product> getAllProducts() {
		return listOfProducts;
	}
	
	// 상품 상세 정보를 가져오는 메소드
	// SELECT * FROM PROD WHERE PROD_ID = 'P101000001";
	public Product getProductById(String productId) {
		Product productById = null;
		// listOfProducts.size() : 3건(phone, noteboot, tablet)
		// List<Product> listOfProducts
		for(int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			// 등록된 상품이 있어야 하고, 상품 코드가 있어야하며, 
			// 그때의 그 상품코드와 매개변수에 담긴 파라미터 상품코드가 같을 때에만 실행
			if(product != null && product.getProductId() != null
					&& product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	// 상품 추가
	public void addProduct(Product product) {
//		private List<Product> listOfProducts = new ArrayList<Product>();
		listOfProducts.add(product);
	}
}
