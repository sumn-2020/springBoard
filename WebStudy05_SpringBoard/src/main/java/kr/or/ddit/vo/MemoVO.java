package kr.or.ddit.vo;

import java.sql.Date;

import lombok.Data;
import lombok.RequiredArgsConstructor;




@Data //getter setter 합쳐놓은거
@RequiredArgsConstructor
public class MemoVO {
	
	private String code;
	private String writer;
	private String content;
	private Date date1;
		
	
	
}
