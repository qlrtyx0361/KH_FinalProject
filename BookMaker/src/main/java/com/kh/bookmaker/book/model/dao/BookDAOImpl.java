package com.kh.bookmaker.book.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookmaker.book.model.vo.Book;
import com.kh.bookmaker.book.model.vo.BookImage;

@Repository
public class BookDAOImpl implements BookDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Book> selectBookList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("book.selectBookList", null, rows);
	}

	@Override
	public int selectBookTotalContents() {
		return sqlSession.selectOne("book.selectBookTotalContents");
	}

	@Override
	public Book selectBook(long isbn) {
		return sqlSession.selectOne("book.selectBook", isbn);
	}

	@Override
	public List<BookImage> selectBookImageList(long isbn) {
		return sqlSession.selectList("book.selectBookImageList", isbn);
	}

}
