package kr.or.ddit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/ajaxHome")
	public String ajaxHome() {
		// forwarding
		return "ajaxHome";
	}
}
