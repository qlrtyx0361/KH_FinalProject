package com.kh.bookmaker.book.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmaker.book.model.dao.BookDAO;
import com.kh.bookmaker.book.model.vo.Book;

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

}
