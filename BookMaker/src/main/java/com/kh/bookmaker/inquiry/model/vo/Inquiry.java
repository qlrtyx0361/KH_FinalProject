package com.kh.bookmaker.inquiry.model.vo;

import java.sql.Date;


import java.util.ArrayList;
import java.util.List;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Inquiry {
	private int inquiryNo;
	private String memberId;
	private int inquiryTypeNo;
	private String inquiryTitle;
	private String inquiryContent;
	private Date uploadDate;
	private int inquiryReadCount;
	//가상컬럼에 대한 필드추가
	private int fileCount;
	//첨부파일에 대한 필드추가
	private List<InquiryFile> files = new ArrayList<>();
	
}