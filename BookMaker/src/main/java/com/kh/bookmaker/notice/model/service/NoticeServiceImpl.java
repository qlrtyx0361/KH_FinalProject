package com.kh.bookmaker.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmaker.notice.model.dao.NoticeDAO;
import com.kh.bookmaker.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<Notice> selectNoticeList(int cPage, int numPerPage) {
		return noticeDAO.selectNoticeList(cPage, numPerPage);
	}

	@Override
	public int selectNoticeTotal() {
		return noticeDAO.selectNoticeTotal();
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return noticeDAO.selectNotice(noticeNo);
	}

	@Override
	public int updateCount(int noticeNo) {
		return noticeDAO.updateCount(noticeNo);
	}

	@Override
	public int insertNotice(Notice notice) {
		return noticeDAO.insertNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeDAO.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return noticeDAO.deleteNotice(noticeNo);
	}
	
}
