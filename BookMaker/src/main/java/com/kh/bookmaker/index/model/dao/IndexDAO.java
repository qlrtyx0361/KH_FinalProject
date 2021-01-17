package com.kh.bookmaker.index.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookmaker.book.model.vo.Book;

@Repository
public class IndexDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Book> selectBookList(int numPerPage) {
		RowBounds rows = new RowBounds(0, numPerPage);
		return sqlSession.selectList("index.selectBookList", null, rows);
	}
	
}
