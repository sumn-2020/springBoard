package kr.or.ddit.memoAjax.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	 * @return  memoAjax/memoList
	 */
	@GetMapping("memoList")
	public String selectMemo(
			
	) {
		
		MemoAjaxVO memoAjaxVO = new MemoAjaxVO();
		List<MemoAjaxVO> memoAjaxSelect = memoAjaxService.MemoAjaxSelect(memoAjaxVO);
		log.info("memoAjaxSelect : " + memoAjaxSelect);
		
		return "memoAjax/memoList";
	}
	
	/**
	 * 아작스 진입 
	 * @param memoAjaxVO
	 * @return
	 */
	@ResponseBody
	@GetMapping(value="/memoListResponse", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<MemoAjaxVO> memoListResponse(
		MemoAjaxVO memoAjaxVO
	) {
		
		//log.info("ajax들어옴");
		
		List<MemoAjaxVO> memoAjaxSelect = memoAjaxService.MemoAjaxSelect(memoAjaxVO);
		log.info("memoAjaxSelect : " + memoAjaxSelect);
		
		return memoAjaxSelect; //resp로 반환

	}
	
	///////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 뷰페이지 
	 * @param code
	 * @param memoAjaxVO
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("memoView/{code}")
	public MemoAjaxVO memoAjaxViewUI(
		@PathVariable String code
		, MemoAjaxVO memoAjaxVO
		,Model model
	) {
		
		//상세 정보 불러오기
		memoAjaxVO = memoAjaxService.memoAjaxView(code);
		log.info("memoAjaxVO: "+ memoAjaxVO);
		
		return memoAjaxVO;
	}
	
	////////////////////////////////////////////////////////////////////////////////////////

	
	
	/**
	 * 등록 신규 insert
	 * @return
	 */
	@ResponseBody
	@PostMapping("MemoAjaxInsert")
	public int memoAjaxInsert(
			@RequestBody MemoAjaxVO memoAjaxVO
	) {
		
		log.info("들어옴 :::");
		
		int result = this.memoAjaxService.memoAjaxCreate(memoAjaxVO);
		return result;
		
	}
	
	
	////////////////////////////////////////////////////////////////////////
	
	/**
	 * 삭제
	 * @return
	 */
	@ResponseBody
	@PostMapping("memoAjaxDelete/{code}")
	public int memoAjaxDelete(
		@PathVariable String code
	) {
		
		//log.info("delet 시작::: ");
		int result = memoAjaxService.memoAjaxDelete(code);
		log.info("resultresultresult :: " + result);
		return result;
	}
	
	
	////////////////////////////////////////////////////////////////////////
	
	
	/**
	 * 수정UI
	 * @param code
	 * @return
	 */
	@ResponseBody
	@PostMapping("memoAjaxUpdateUI/{code}")
	public MemoAjaxVO memoAjaxUpdateUI(
		@PathVariable String code
	) {
		 MemoAjaxVO memoAjaxVO = memoAjaxService.memoAjaxView(code);
		 return memoAjaxVO;
	}
	
	
	/**
	 * 수정
	 * @param code
	 * @return
	 */
	@ResponseBody
	@PostMapping("memoAjaxUpdate/{code}")
	public String memoAjaxUpdate(
		@PathVariable String code
		,@RequestBody MemoAjaxVO memoAjaxVO //url상에서 데이터를 전달하는 경우(form 태그 등) @RequestParam 을 이용하고,그 외의 경우 @RequestBody 를 이용하자!
		, Model model
	) {
		log.info("memoAjaxVO:!!!!!!!!!" + memoAjaxVO);
		int result = memoAjaxService.memoAjaxUpdate(memoAjaxVO);
		return result + "";
		
		/*String viewName = null;
		int rowcnt = memoAjaxService.memoAjaxUpdate(memoAjaxVO);
		if(rowcnt > 0) {
			viewName = "redirect:/memoAjax/memoList" + code;
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "memoAjax/memoList";
		}
		
		return viewName;*/
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
}
