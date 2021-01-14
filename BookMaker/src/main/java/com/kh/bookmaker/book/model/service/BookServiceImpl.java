package com.kh.bookmaker.book.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmaker.book.model.dao.BookDAO;
import com.kh.bookmaker.book.model.vo.Book;
import com.kh.bookmaker.book.model.vo.BookImage;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDAO bookDAO;
	
	@Override
	public List<Book> selectBookList(int cPage, int numPerPage) {
		return bookDAO.selectBookList(cPage, numPerPage);
	}

	@Override
	public int selectBookTotalContents() {
		return bookDAO.selectBookTotalContents();
	}

	@Override
	public Book selectBook(long isbn) {
		return bookDAO.selectBook(isbn);
	}

	@Override
	public List<BookImage> selectBookImageList(long isbn) {
		return bookDAO.selectBookImageList(isbn);
	}

}
