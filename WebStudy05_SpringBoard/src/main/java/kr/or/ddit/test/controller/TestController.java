package kr.or.ddit.test.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.sound.midi.MidiDevice.Info;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.test.service.TestService;
import kr.or.ddit.vo.TestVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/test")
public class TestController {
	
	@Inject
	private TestService service;
	
	
	//시험문제 화면  open
	@RequestMapping("test")
	public String test (
		TestVO testVO
		,Model model	
	) {

		try {
			//시험문제 + 시험지문 조인 
			List<TestVO> testPasg = service.testPasgList(testVO);
			log.info("testPasg:::" + testPasg);

			model.addAttribute("testPasg", testPasg);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test/test";
	}
	
	
	
	//아작스로 시험지문 빼내기
	@ResponseBody
	@RequestMapping("ajaxPasg")
	public List<TestVO>  testPasg(
			TestVO testVO
	) {
		log.info(" 아작스진입");
		
		List<TestVO> testPage = service.testPasgList(testVO);
		return testPage;
		
	}
	
	
	
	
	

	
	
	

}
