package kr.or.ddit.memoAjax.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.memoAjax.vo.MemoAjaxVO;

@Mapper
public interface MemoAjaxDao {

	/**
	 * 리스트 추출
	 * @return
	 */
	public List<MemoAjaxVO> memoAjaxSelect(MemoAjaxVO memoAjaxVO);
	

	/**
	 * 뷰 페이지 
	 * @param memoAjaxVO
	 * @return
	 */
	public MemoAjaxVO memoAjaxView(String code);
	
	
	/**
	 * insert 신규
	 * @param memoAjaxVO
	 * @return
	 */
	public int memoAjaxInsert(MemoAjaxVO memoAjaxVO);
	
	
	
	/**
	 * 삭제
	 * @param code
	 * @return
	 */
	public int memoAjaxDelete(String code);
	
}
