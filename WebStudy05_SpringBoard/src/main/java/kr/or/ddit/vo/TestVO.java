package kr.or.ddit.vo;

import java.util.List;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class TestVO {

	
	//testQ 문제 
	private String testQId;  
	private String testNum;
	private String testQuest;
	private String testAns;
	
	
	//지문
	private List<TestPasgVO> pasgList; //has many 관계 (1:N)
	
	
}
