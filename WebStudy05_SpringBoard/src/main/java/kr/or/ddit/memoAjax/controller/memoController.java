package kr.or.ddit.memoAjax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/memoAjax")
public class memoController {

	
	
	@RequestMapping("memoList")
	public String selectMemo() {
		return "memoAjax/memoList";
	}
	
	
	
}
