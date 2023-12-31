package kr.or.ddit.test.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.sound.midi.MidiDevice.Info;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.test.service.TestService;
import kr.or.ddit.vo.TestSubmitVO;
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
	

	
	//시험제출 
	@ResponseBody
	@PostMapping("testSubmit")
	public int testSubmitInsert(
		TestSubmitVO testSubmitVO
	) {
		log.info("아작스 들어옴");
		
		int result = service.testSubmit(testSubmitVO);
		return result;
	}
	
	

	
	
	

}
