package ch04.com.dao;

import java.io.Serializable;

/*
  MVC 패턴?
  M(Model) : 비즈니스 로직, 자바빈즈 클래스
  V(View) : jsp
  C(Controller) : Servlet
  
  화면을 출력하는 부분과 데이터를 처리하는 로직(비즈니스 로직)을 분리.
  로직(비즈니스 로직) 부분의 코드에 자바빈스라는 클래스를 사용
  
  * 자바빈즈의 동작 흐름
  1) 웹 브라우저가 톰켓(컨테이너 : 웹서버 + 서블릿)에게 JSP 페이지 요청
  2) 자바빈즈와 통신
  3) 자바빈즈가 데이터베이스에 연결
  4) 톰켓이 웹 브라우저에게 응답
 */

// 자바빈 클래스
public class MemberBean implements Serializable {
	// 필드(멤버변수, property)
	private int id;
	private String name;

	// 기본 생성자
	public MemberBean() {

	}

	// getter/setter
	// 멤버 변수에 저장된 값을 가졍로 수 있음
	public int getId() {
		return id;
	}
	
	// 멤버 변수에 값을 저장할 수 있음
	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
