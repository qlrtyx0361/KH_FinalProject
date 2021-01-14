package com.kh.bookmaker.book.model.dao;

import java.util.List;

import com.kh.bookmaker.book.model.vo.Book;
import com.kh.bookmaker.book.model.vo.BookImage;

public interface BookDAO {

	List<Book> selectBookList(int cPage, int numPerPage);
	
	int selectBookTotalContents();
	
	Book selectBook(long isbn);
	
	List<BookImage> selectBookImageList(long isbn);
}
