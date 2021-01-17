package com.kh.bookmaker.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int noticeNo;
	private int memberNo;
	private String memberId;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int noticeCount;
}
