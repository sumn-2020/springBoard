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
	 * select
	 */
	@Override
	public List<MemoAjaxVO> MemoAjaxSelect(MemoAjaxVO memoAjaxVO) {
		List<MemoAjaxVO> memoAjaxSelect = memoAjaxDao.memoAjaxSelect(memoAjaxVO); 
		return memoAjaxSelect;
	}
	
	
}
