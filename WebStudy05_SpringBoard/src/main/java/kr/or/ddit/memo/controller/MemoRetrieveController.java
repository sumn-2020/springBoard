package kr.or.ddit.memo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.memo.service.MemoService;
import kr.or.ddit.vo.MemoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/memo")
public class MemoRetrieveController {

	//service 주입
	private final MemoService memoService;
	
	
	// 목록페이지 select 
	@RequestMapping("memoList.do")
	public String memoList(Model model) {
		
		//select 꺼내오기 
		
		//데이터 하나일 경우 
		//MemoVO memoVO = new MemoVO();
		//MemoVO memo = memoService.retrieveMemoList(memoVO);
		//model.addAttribute("memoList", memo);
		//System.out.println("여기메모:::");
		//System.out.println(memo);
		//log.info("여기controller: " +  memo);
		
		//데이터 두개 이상일 경우 
		List<MemoVO> memoList = null;
		memoList = memoService.retrieveMemoList(memoList);
		
		//코드 값 가져오기 위한 생성자 만들기 (상세페이지로 코드값 파라미터 넘기기위한 작업)
		for (int i = 0; i < memoList.size(); i++) {
			log.info("리스트에서 뽑은 거!!" +  memoList.get(i).getCode());
		}

		model.addAttribute("memoList", memoList);
		return "memo/memoList";
	}
	
	
	////////////////////////////////////////////////////////////////////////////////////
	
	//상세페이지 - select 
	@RequestMapping("memoDetail.do")
	public String memoDetail(
		@RequestParam(value="code", required=true) String code
		,Model model	
	) {
		
		
		MemoVO memoDetail = memoService.retrieveMemo(code);
		log.info("memoDetail: " + memoDetail);
		
		
		model.addAttribute("memoDetail", memoDetail);
		
		return "memo/memoDetail";
	}
	
	///////////////////////////////////////////////////////
	
	//등록페이지 select
	@RequestMapping("memoForm.do")
	public String retrieveInsertPage(
			Model model
	) {
		return "/memo/memoForm";
	}
	
	
	
	//저장버튼 클릭시 insert
	@PostMapping("form.do")
	public String memoInsert(
			@ModelAttribute("memoForm") MemoVO memoVO
			,Model model
	) {
		
		String viewName = null;
		
		int rowcnt = memoService.createMemo(memoVO);
		if(rowcnt > 0) {
			viewName = "redirect:/memo/memoList.do";
		}else {
			model.addAttribute("message", "서버오류");
			viewName = "/memo/form.do";
		}
		
		return viewName;
	}
	
	
	
	
	
	
}
