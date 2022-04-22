package kr.or.ddit.cus.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.cus.service.CusService;
import kr.or.ddit.cus.vo.AttachFilesVO;
import kr.or.ddit.cus.vo.CusVO;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.util.UserUtil;

@RequestMapping("/cus")
@Controller
public class CusController {
	private static final Logger logger = 
			LoggerFactory.getLogger(CusController.class);
	
	@Autowired
	CusService cusService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model,
			@RequestParam(defaultValue="1", required = false) int currentPage,
			@RequestParam(defaultValue="5", required = false) int size,
			@RequestParam(required = false) String keyWord) {

		model.addAttribute("pageHeader", UserUtil.getPageHeader("Customer", "고객등록"));

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		map.put("size", size);
		map.put("keyWord", keyWord);
		
		List<CusVO> list = this.cusService.select(map);
		int total = this.cusService.getTotal(map);
		
		model.addAttribute("list", 
				new ArticlePage(total, currentPage, size, 5, list, keyWord));
		model.addAttribute("total", total);
		
		// forwarding
		return "cus/list";
	}
	
	@GetMapping("/insert")
	public String insert(Model model) {
		Map<String, String> pageHeader = new HashMap<String, String>();
		pageHeader.put("subtitle", "Customer");
		pageHeader.put("title", "고객 등록");
		
		model.addAttribute("pageHeader", pageHeader);
		model.addAttribute("cusVO", new CusVO());
		// forwarding
		return "cus/insert";
	}
	
	@PostMapping("/insert")
	public String insertPost(@Validated CusVO cusVO,
			BindingResult result) {
		//validation 문제가 발생된다면
		if(result.hasErrors()) {
			List<ObjectError> allErrors = result.getAllErrors();
			List<ObjectError> globalErrors = result.getGlobalErrors();
			List<FieldError> fieldErrors = result.getFieldErrors();
			//validation 중에 어떤 오류가 나왔는지 확인..
			for(int i=0;i<allErrors.size();i++) {
				ObjectError objectError = allErrors.get(i);
				logger.info("objectError : " + objectError);
			}
			
			for(ObjectError objectError : globalErrors) {
				logger.info("objectError : " + objectError);
			}
			
			for(FieldError fieldError : fieldErrors) {
				logger.info("fieldError : " + fieldError.getDefaultMessage());
			}
			// redirect(x) => 데이터를 보낼 수 없음
			// forwarding(o)
			//문제가 발생되면 수정프로세스는 중단되고 forward
			return "cus/insert";
		}//end if
		
		logger.info("cusVO : " + cusVO.toString());
		
		//수정 비즈니스 로직 처리 후 -> 몇 건이 update되었나..
		int insertResult = cusService.insert(cusVO);
		
		if(!(insertResult > 0)) {//수정 실패
			return "cus/insert";
		}
		
		//상세페이지로 되돌아감
		return "rediret:/cus/list";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam String cusNum) {
		model.addAttribute("pageHeader", UserUtil.getPageHeader("Customer", "고객 상세"));
		
		logger.info("cusNum : " + cusNum);
		
		List<CusVO> list = this.cusService.detail(cusNum);
		
		// buyerVO이 null이면 오류를 보정
		if(list != null) {
//			logger.info("cusVO : " + list.toString());
		}
		
		for (CusVO cusVO : list) {
			model.addAttribute("cusVO", cusVO);
			logger.info("cusVO : " + cusVO.toString());
		}
		
		//forward
		//반환값이 lprod/detail이므로 lprod폴더의 detail.jsp를 리턴
		return "cus/detail";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String detailPost(@Validated CusVO cusVO,
			BindingResult result) {
		logger.info("cusVO^^^^^^^^^^^^ : " + cusVO.toString());
		//validation 중에 문제가 발생하면 true
		logger.info("result.hasErrors() : " + result.hasErrors());
		//validation 문제가 발생된다면
		if(result.hasErrors()) {
			List<ObjectError> allErrors = result.getAllErrors();
			List<ObjectError> globalErrors = result.getGlobalErrors();
			List<FieldError> fieldErrors = result.getFieldErrors();
			//validation 중에 어떤 오류가 나왔는지 확인..
			for(int i=0;i<allErrors.size();i++) {
				ObjectError objectError = allErrors.get(i);
				logger.info("objectError : " + objectError);
			}
			
			for(ObjectError objectError : globalErrors) {
				logger.info("objectError : " + objectError);
			}
			
			for(FieldError fieldError : fieldErrors) {
				logger.info("fieldError : " + fieldError.getDefaultMessage());
			}
			//문제가 발생되면 수정프로세스는 중단되고 forward
			return "lprod/detail";
		}//end if
		
		if(cusVO.getUploadFile() != null) {
			this.cusService.deleteAttachFiles(cusVO.getCusNum());
			
			logger.info("121마마");
			
			logger.info("cusBO");
			//수정 비즈니스 로직 처리 후 -> 몇 건이 update되었나..
			int insertResult = cusService.insertAttachFiles(cusVO);
			
			if(!(insertResult > 0)) {//수정 실패
				return "cus/detail";
			}
			logger.info("cusVO : " + cusVO.toString());
			
			//수정 비즈니스 로직 처리 후 -> 몇 건이 update되었나..
			int modifyResult = this.cusService.update(cusVO);
			
			if(modifyResult < 1) {//수정 실패
				return "cus/detail";
			}
		} else {
			//수정 비즈니스 로직 처리 후 -> 몇 건이 update되었나..
			int modifyResult = this.cusService.update(cusVO);
			
			if(modifyResult < 1) {//수정 실패
				return "cus/detail";
			}
			
		}
			
		
			
		
		
		//상세페이지로 되돌아감
		return "redirect:/cus/detail?cusNum="+cusVO.getCusNum();
	}
	
}
