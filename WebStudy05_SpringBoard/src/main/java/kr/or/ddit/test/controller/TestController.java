package kr.or.ddit.test.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.MidiDevice.Info;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.apache.tiles.request.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParser;

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
	private TestSubmitVO testSubmitVO;
	
	
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
/*	@ResponseBody
	@PostMapping("testSubmit")
	public List<Map<String, Object>> testSubmitInsert(
		@RequestBody List<Map<String, Object>> param
	) {
		
		
		
		log.info("sdf::");
		
		return param;
	}
	
	*/
	
	
	@ResponseBody
	@PostMapping("testSubmit")
	public int testSubmitInsert(
		@RequestBody List<String> testIdArray
		//application/json 형식으로 데이터를 전송하고 있으므로, 컨트롤러에서 @RequestBody 어노테이션을 사용하여 받아야 합니다.
		//  @RequestBody 사용해야됨 
				
	) {
		log.info("testIdArray: " + testIdArray);
		/*for (String testId : testIdArray) {
			log.info("testId: " + testId);
		}*/
		
		
		//int result = service.testSubmit(testSubmitVO); 
	
		
		return 1;
		
	}
	
	

	
	
	

}
