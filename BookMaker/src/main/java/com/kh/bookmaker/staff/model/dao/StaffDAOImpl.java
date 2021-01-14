package com.kh.bookmaker.staff.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookmaker.book.model.vo.Book;
import com.kh.bookmaker.book.model.vo.BookImage;
import com.kh.bookmaker.member.model.vo.Member;

@Repository
public class StaffDAOImpl implements StaffDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Member> selectMemberList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("staff.selectMemberList", null, rows);
	}

	@Override
	public int selectMemberTotal() {
		return sqlSession.selectOne("staff.selectMemberTotal");
	}

	@Override
	public Member selectMember(int memberNo) {
		return sqlSession.selectOne("staff.selectMember", memberNo);
	}

	@Override
	public List<Book> selectBookList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("staff.selectBookList", null, rows);
	}

	@Override
	public int selectBookTotal() {
		return sqlSession.selectOne("staff.selectBookTotal");
	}

	@Override
	public int insertBook(Book book) {
		return sqlSession.insert("staff.insertBook", book);
	}

	@Override
	public int insertBookImage(BookImage bookImage) {
		return sqlSession.insert("staff.insertBookImage", bookImage);
	}
	
	
}
