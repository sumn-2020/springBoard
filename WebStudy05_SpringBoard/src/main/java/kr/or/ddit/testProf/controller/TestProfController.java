package kr.or.ddit.testProf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/testProf")
public class TestProfController {

	
	
	@RequestMapping("testForm")
	public String testProfUI() {
		return "testProf/testProf";
	}
	
	
	
	
	
}
