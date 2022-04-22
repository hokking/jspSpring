package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;

/*
 * 스프링은 직접 클래스를 생성하는 것을 지양(안함)하고, 
 * 인터페이스를 통해 접근하는 것을 권장하는 프레임워크.
 */
public interface MemberService {
	//메소드 시그니처 처리
	//회원 가입
	public int insert(MemberVO memberVO);

	public List<MemberVO> select();
	
	//회원 아이디 중복 체킹
	public int memberDupChk(String memberid);

	//회원(카드) 상세 정보
	public List<MemberVO> detail(String memberid);
}





