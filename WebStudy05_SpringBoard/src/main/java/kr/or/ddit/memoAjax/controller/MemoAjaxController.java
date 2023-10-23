package kr.or.ddit.memoAjax.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	
}
