package kr.or.ddit.test.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.TestVO;

public interface TestService {

	/**
	 * 시험문제 리스트
	 * @return
	 */
	public List<Map<String, Object>> testQList();
	
	
	/**
	 * 시험지문 
	 * @param testQId
	 * @return
	 */
	public List<Map<String, Object>> testPasgList(String testQId);
	
}