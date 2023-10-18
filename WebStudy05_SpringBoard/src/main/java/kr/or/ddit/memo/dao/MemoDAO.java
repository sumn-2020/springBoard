package kr.or.ddit.memo.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.MemoVO;




@Mapper
public interface MemoDAO {
	
	//xml - dao 연결
	
	/**
	 * 데이터 한개일 경우 
	 * @param memoVO
	 * @return
	 */
	//public MemoVO selectMemo(MemoVO memoVO); //dao id명과 같아야됨 

	/**
	 * 데이터 두개 이상 추출
	 * @param memoVO
	 * @return
	 */
	public List<MemoVO> selectMemo(List<MemoVO> memoVO);

	/**
	 * 파라미터로 값 넘기기 - 상세페이지 
	 * @param code
	 * @return
	 */
	public MemoVO selectMemoDetail(@Param("code") String code);
	
	// 
	/**
	 * insert - 게시글등록
	 * @param memoVO
	 * @return
	 */
	public int insertMemo(MemoVO memoVO);
	
	
	
	/**
	 * 수정페이지 select
	 * @param memoVO
	 * @return
	 */
	public int updateMemo(MemoVO memoVO);
	
}
