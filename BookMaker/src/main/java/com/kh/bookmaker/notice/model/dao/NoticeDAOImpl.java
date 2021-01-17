package com.kh.bookmaker.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookmaker.notice.model.vo.Notice;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Notice> selectNoticeList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("notice.selectNoticeList", null, rows);
	}

	@Override
	public int selectNoticeTotal() {
		return sqlSession.selectOne("notice.selectNoticeTotal");
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return sqlSession.selectOne("notice.selectNotice", noticeNo);
	}

	@Override
	public int updateCount(int noticeNo) {
		return sqlSession.update("notice.updateCount", noticeNo);
	}

	@Override
	public int insertNotice(Notice notice) {
		return sqlSession.insert("notcie.insertNotice", notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		return sqlSession.update("notice.updateNotice", notice);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return sqlSession.delete("notice.deleteNotice", noticeNo);
	}
	
	
	
}
