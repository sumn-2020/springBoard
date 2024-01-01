package kr.or.ddit.test.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.test.dao.TestDAO;
import kr.or.ddit.vo.TestSubmitVO;
import kr.or.ddit.vo.TestVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TestServiceImpl implements TestService {
	
	@Inject
	private TestDAO dao;



	/**
	 * 시험지문 
	 */
	@Override
	public List<TestVO> testPasgList(TestVO testVO) {
		List<TestVO> testPasg = dao.testPasgList(testVO);
		return testPasg;
	}


	/**
	 * 시험제출 
	 */
	@Override
	public int testSubmit(TestSubmitVO testSubmitVO) {
		int rowcnt = dao.testSubmit(testSubmitVO);
		return rowcnt;
	}
	
	
	
	
	
	
	
	
	
}
