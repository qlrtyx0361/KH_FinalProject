package com.kh.bookmaker.inquiry.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class InquiryAnswer {
	
	
	private int inquiryAnswerNo;
	private int inquiryNo;
	private String inquiryAnswerContent;
	private Date uploadDate;
	private String memberId;
	private String inquiryAnswerTitle;
	//가상컬럼에 대한 필드추가
		private int fileCount;
		//첨부파일에 대한 필드추가
		private List<InquiryFile> files = new ArrayList<>();
	
	


}
