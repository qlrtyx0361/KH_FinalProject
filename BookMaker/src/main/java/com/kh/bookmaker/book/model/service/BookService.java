package com.kh.bookmaker.book.model.service;

import java.util.List;

import com.kh.bookmaker.book.model.vo.Book;

public interface BookService {
	
	List<Book> selectBookList(int cPage, int numPerPage);
	
	int selectBookTotalContents();
}
