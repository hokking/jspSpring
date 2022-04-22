package kr.or.ddit.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ErrorController {
	private static final Logger logger = 
			LoggerFactory.getLogger(ErrorController.class);
	
	// 경로 패턴 매핑
	// 요청 경로를 동적으로 표현이 가능한 경로 패턴 지정
	// - URL 경로 상의 변하는 값을 경로 변수로 취급
	// - 경로 변수에 해당하는 값을 파라미터 변수에 설정
	// /error/500
	@GetMapping(value = "/error/{errorNo}")
	public String errorHandler(@PathVariable("errorNo") int errorNo,
			Model model) {
		logger.info(errorNo + "오류 발생!");
		
		model.addAttribute("error", errorNo);
		
		return "error/errorHandler";
	}
}
