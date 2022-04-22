package kr.or.ddit.member.mapper;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;

public interface MemberMapper {
	//회원 가입
	public int insert(MemberVO memberVO);
	
	//회원정보 목록
	public List<MemberVO> select();
	
	//회원(카드) 상세 정보
	public List<MemberVO> detail(String memberid);
	
	//회원상세 정보
	public MemberVO read(String userName);
	
	//회원 아이디 중복 체킹
	public int memberDupChk(String memberid);
}
