package kr.or.ddit.memoAjax.service;

import java.util.List;

import kr.or.ddit.memoAjax.vo.MemoAjaxVO;

public interface MemoAjaxService  {

	
	/**
	 * list select  
	 * @param memoAjaxVO
	 * @return
	 */
	public List<MemoAjaxVO>  MemoAjaxSelect(MemoAjaxVO memoAjaxVO);
	
	
	/**
	 * 뷰페이지 view select
	 * @param memoAjaxVO
	 * @return
	 */
	public MemoAjaxVO memoAjaxView(String code);
	
	
	
	/**
	 * create 신규
	 * @param memoAjaxVO
	 * @return
	 */
	public MemoAjaxVO memoAjaxCreate(MemoAjaxVO memoAjaxVO);
	
}
