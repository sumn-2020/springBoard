package kr.or.ddit.memoAjax.vo;

import java.sql.Date;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class MemoAjaxVO {

	
	private String code;
	private String writer;
	private String content;
	private Date date1;
	
}
