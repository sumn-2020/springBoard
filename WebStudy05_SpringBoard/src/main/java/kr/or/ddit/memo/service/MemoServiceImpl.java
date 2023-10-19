package kr.or.ddit.memo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.memo.dao.MemoDAO;
import kr.or.ddit.vo.MemoVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class MemoServiceImpl implements MemoService{

	@Inject
	private MemoDAO memoDAO;

	

	
	// memo 조회 
	/* 데이터 하나 일 경우 
	@Override
	public MemoVO retrieveMemoList(MemoVO memoVO) {
		MemoVO memo = memoDAO.selectMemo(memoVO);
		//log.info("여기service: " +  memo);
		return memo;
	}*/
	
	
	//데이터 두개 이상일 경우
	@Override
	public List<MemoVO> retrieveMemoList(List<MemoVO> memoVO) {
		List<MemoVO> memo = memoDAO.selectMemo(memoVO);
		return memo;
	}



	//파라미터로 값 넘기기 - 상세페이지 
	@Override
	public MemoVO retrieveMemo(String code) {
		return this.memoDAO.selectMemoDetail(code);
	}



	
	//등록 insert 
	@Override
	public int createMemo(MemoVO memoVO) {
		int rowcnt = memoDAO.insertMemo(memoVO);
		return rowcnt;
	}


	//수정페이지 
	@Override
	public int modifyMemo(MemoVO memoVO) {
		int rowcnt = memoDAO.updateMemo(memoVO);
		return rowcnt;
	}


	//삭제
	@Override
	public int deleteMemo(String code) {

		int rowcnt = memoDAO.deleteMemo(code);
		return rowcnt;
	}

	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
