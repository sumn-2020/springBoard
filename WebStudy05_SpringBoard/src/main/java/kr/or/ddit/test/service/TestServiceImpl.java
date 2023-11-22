package kr.or.ddit.test.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.test.dao.TestDAO;
import kr.or.ddit.vo.TestVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TestServiceImpl implements TestService {
	
	@Inject
	private TestDAO dao;

	
	/**
	 * 시험문제 리스트 
	 */
	@Override
	public List<TestVO> testQList() {
		List<TestVO> testVoList = dao.testQList();
		log.info("testVOservice :::: " + testVoList);
		
		return testVoList;
	}

	/**
	 * 시험지문 
	 */
	@Override
	public List<TestVO> testPasgList(TestVO testVO) {
		List<TestVO> testPasg = dao.testPasgList(testVO);
		return testPasg;
	}
	
	
	
	
	
	
}
