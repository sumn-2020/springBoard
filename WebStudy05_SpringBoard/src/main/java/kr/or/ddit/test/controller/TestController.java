package kr.or.ddit.test.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.sound.midi.MidiDevice.Info;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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
			//시험문제
			List<TestVO> testVOList = service.testQList();
			
			
			//시험지문
			//하..... 지문 출력하고있는데 각 문제 당 각각의 지문들을 출력하기 위해서 
			// 각 문제 ID값을 set해서 넣고 그 값을 파라미터값으로 가져와서 각 문제마다 각각의 지문들 출력하려고 시도 ..
			//근데 계속 캐스팅 잘못됐다고 뜸... 쉣!!!!!!!!!!!!
			
			//위에거는 해결했는데........ 아니 왜 갑자기 java.lang.NumberFormatException 이거뜨는거냐고... 
			
			/*TestVO selectedQues = null; //시험문제 
			List<TestVO> testPasg = null; //시험지문 
			for (TestVO testQList : testVOList) {
				selectedQues = testQList; //시험문제에서 testQId 빼내서 
			}
			String testQId = selectedQues.getTestQId();
			log.info("testQId:::" + testQId);*/
			
			List<TestVO> testPasg = service.testPasgList(testVO);
			log.info("testPasg:::" + testPasg);
			
			model.addAttribute("testVOList", testVOList);
			model.addAttribute("testPasg", testPasg);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return "test/test";
	}
	
	
	
	

	
	
	

}
