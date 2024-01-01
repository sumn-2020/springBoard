package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;
import lombok.RequiredArgsConstructor;


@Data
@RequiredArgsConstructor
public class TestPasgVO {

	private String testpasgId; //--지문ID
	private String testQId; //-- 문제ID(외래키)
	private String testPasg; // --지문
	private String answState; // --문제정답여부
	
	
}



