package kr.or.ddit.cus.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.cus.vo.AttachFilesVO;
import kr.or.ddit.cus.vo.CusVO;

public interface CusService {
	// 고객 등록
	public int insert(CusVO cusVO);
	
	// 고객 목록
	public List<CusVO> select(Map<String, Object> map);
	
	// 고객 목록 개수
	public int getTotal(Map<String, Object> map);
	
	// 상세 고객 정보
	public List<CusVO> detail(String cusNum);
	
	// 고객 정보 수정
	public int update(CusVO cusVO);
	
	// 고객 이미지 파일 삭제
	public int deleteAttachFiles(String id);
	
	public int insertAttachFiles(CusVO cusVO);

}
