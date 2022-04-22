package kr.or.ddit.cus.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.cus.vo.AttachFilesVO;
import kr.or.ddit.cus.vo.CusVO;

public interface CusMapper {
	// 고객 등록
	public int insert(CusVO cusVO);
	
	// 고객의 파일들을 함께 등록
	public int insertAttachFiles(List<AttachFilesVO> attachFilesVO);
	
	// 고객 목록
	public List<CusVO> select(Map<String, Object> map);
	
	// 고객 목록 개수
	public int getTotal(Map<String, Object> map);
	
	// 상세 고객 정보
	public List<CusVO> detail(String cusNum);
	
	// 고객 정보 수정
	public int update(CusVO cusVO);
	
	// 스프링 시큐리티의 로그인 처리
	public CusVO read(String userName);
	
	// 고객 이미지 파일 삭제
	public int deleteAttachFiles(String id);
}
