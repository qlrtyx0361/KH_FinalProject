package com.kh.bookmaker.book.model.dao;

import java.util.List;

import com.kh.bookmaker.book.model.vo.Book;

public interface BookDAO {

	List<Book> selectBookList(int cPage, int numPerPage);
	
	int selectBookTotalContents();
}
