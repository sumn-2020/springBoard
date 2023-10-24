package kr.or.ddit.memoAjax.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.memoAjax.service.MemoAjaxService;
import kr.or.ddit.memoAjax.vo.MemoAjaxVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/memoAjax")
public class MemoAjaxController {

	
	@Inject
	private MemoAjaxService memoAjaxService;
	
	
	/**
	 * select(ajax)
	 * @return
	 */
	@GetMapping("memoList")
	public String selectMemo(
			
	) {
		
		MemoAjaxVO memoAjaxVO = new MemoAjaxVO();
		List<MemoAjaxVO> memoAjaxSelect = memoAjaxService.MemoAjaxSelect(memoAjaxVO);
		log.info("memoAjaxSelect : " + memoAjaxSelect);
		
		return "memoAjax/memoList";
	}
	
	@ResponseBody
	@GetMapping(value="/memoListResponse", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<MemoAjaxVO> memoListResponse(
		MemoAjaxVO memoAjaxVO
	) {
		
		log.info("ajax들어옴");
		
		List<MemoAjaxVO> memoAjaxSelect = memoAjaxService.MemoAjaxSelect(memoAjaxVO);
		log.info("memoAjaxSelect : " + memoAjaxSelect);
		
		return memoAjaxSelect; //resp로 반환

	}
	
	
	
	
}
