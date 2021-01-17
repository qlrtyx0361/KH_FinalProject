package com.kh.bookmaker.notice.model.dao;

import java.util.List;

import com.kh.bookmaker.notice.model.vo.Notice;

public interface NoticeDAO {

	List<Notice> selectNoticeList(int cPage, int numPerPage);
	
	int selectNoticeTotal();
	
	Notice selectNotice(int noticeNo);
	
	int updateCount(int noticeNo);
	
	int insertNotice(Notice notice);
	
	int updateNotice(Notice notice);
	
	int deleteNotice(int noticeNo);
	
}
