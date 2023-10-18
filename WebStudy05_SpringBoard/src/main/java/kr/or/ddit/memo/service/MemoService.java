package kr.or.ddit.memo.service;

import java.util.List;

import kr.or.ddit.vo.MemoVO;

public interface MemoService {
	
	//select 
	
	//데이터 하나일 경우 
	//public MemoVO retrieveMemoList(MemoVO memoVO); 
	
	//데이터 두개 이상일 경우
	public List<MemoVO> retrieveMemoList(List<MemoVO> memoVO);

	//파라미터로 값 넘기기 - 상세페이지 
	public MemoVO retrieveMemo(String code);
	
	//등록 insert
	public int createMemo(MemoVO memoVO);
	
	//수정페이지 
	public int modifyMemo(MemoVO memoVO);
	

}
