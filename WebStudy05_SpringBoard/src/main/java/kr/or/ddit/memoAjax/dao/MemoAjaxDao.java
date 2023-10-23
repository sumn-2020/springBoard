package kr.or.ddit.memoAjax.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.memoAjax.vo.MemoAjaxVO;

@Mapper
public interface MemoAjaxDao {

	/**
	 * 한개 리스트 추출
	 * @return
	 */
	public List<MemoAjaxVO> memoAjaxSelect(MemoAjaxVO memoAjaxVO);
	
}
