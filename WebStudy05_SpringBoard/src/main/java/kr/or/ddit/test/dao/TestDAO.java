package kr.or.ddit.test.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.TestVO;

@Mapper
public interface TestDAO {

	

	
	/**
	 * 시험지문 
	 * @param testQId
	 * @return
	 */
	public List<TestVO> testPasgList(TestVO testVO);
	
	
	
	
	
}
