package com.kh.bookmaker.index.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmaker.book.model.vo.Book;
import com.kh.bookmaker.index.model.dao.IndexDAO;

@Service
public class IndexService {
	
	@Autowired
	private IndexDAO indexDAO;
	
	public List<Book> selectBookList(int numPerPage) {
		return indexDAO.selectBookList(numPerPage);
	}
	
}
