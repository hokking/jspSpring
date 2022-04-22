package kr.or.ddit.lprod.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;

import kr.or.ddit.BuyerVO;
import kr.or.ddit.lprod.vo.LprodVO;
import kr.or.ddit.member.vo.MemberVO;

public interface LprodMapper {
	// 상품분류 별 거래처 목록
	public List<LprodVO> list(Map<String, Object> map);
	
	// 상품분류 별 거래처 목록 행의 수
	public int listCount(Map<String, Object> map);
	
	// 거래처 상세 정보
	public BuyerVO detail(String buyerId);
	
	// 거래처 수정
	public int modify(BuyerVO buyerVO);
	
	// 로그인 
	public MemberVO loginPost(MemberVO memberVO);
	
	// 상품별 판매금액 합계 차트
	public List<Map<String, Object>> cartMoney();
}





