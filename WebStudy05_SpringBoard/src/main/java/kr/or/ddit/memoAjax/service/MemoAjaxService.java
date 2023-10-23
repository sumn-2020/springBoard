package kr.or.ddit.memoAjax.service;

import java.util.List;

import kr.or.ddit.memoAjax.vo.MemoAjaxVO;

public interface MemoAjaxService  {

	
	/**
	 * select  
	 * @param memoAjaxVO
	 * @return
	 */
	public List<MemoAjaxVO>  MemoAjaxSelect(MemoAjaxVO memoAjaxVO);
	
	
}
