package kr.or.ddit.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/test")
public class TestController {
	
	@GetMapping("test")
	public String test() {
		return "test/test";
	}
	
	

}
