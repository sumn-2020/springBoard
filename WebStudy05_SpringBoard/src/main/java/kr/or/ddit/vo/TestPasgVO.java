package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;


@Data
public class TestPasgVO {

	private String testpasgId;
	private String testPasg;
	private String answState;
	
	
}



