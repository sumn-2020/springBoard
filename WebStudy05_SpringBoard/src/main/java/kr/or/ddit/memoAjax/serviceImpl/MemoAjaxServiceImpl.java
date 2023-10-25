package kr.or.ddit.memoAjax.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.memoAjax.dao.MemoAjaxDao;
import kr.or.ddit.memoAjax.service.MemoAjaxService;
import kr.or.ddit.memoAjax.vo.MemoAjaxVO;

@Service
public class MemoAjaxServiceImpl implements MemoAjaxService {

	@Inject
	private MemoAjaxDao memoAjaxDao;


	/**
	 * 리스트 select
	 */
	@Override
	public List<MemoAjaxVO> MemoAjaxSelect(MemoAjaxVO memoAjaxVO) {
		List<MemoAjaxVO> memoAjaxSelect = memoAjaxDao.memoAjaxSelect(memoAjaxVO); 
		return memoAjaxSelect;
	}


	/**
	 * 뷰 select
	 */
	@Override
	public MemoAjaxVO memoAjaxView(String code) {
		MemoAjaxVO memoAjaxView = memoAjaxDao.memoAjaxView(code);
		return memoAjaxView;
	}


	/**
	 * 신규 insert
	 */
	@Override
	public MemoAjaxVO memoAjaxCreate(MemoAjaxVO memoAjaxVO) {
		MemoAjaxVO memoAjaxCreate = memoAjaxDao.memoAjaxCreate(memoAjaxVO);
		return memoAjaxCreate;
	}
	
	
	
	
	
	
	
}
