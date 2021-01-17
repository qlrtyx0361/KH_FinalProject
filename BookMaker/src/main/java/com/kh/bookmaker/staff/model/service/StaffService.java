package com.kh.bookmaker.staff.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.bookmaker.book.model.vo.Book;
import com.kh.bookmaker.book.model.vo.BookImage;
import com.kh.bookmaker.member.model.vo.Member;

public interface StaffService {

	List<Member> selectMemberList(int cPage, int numPerPage);
	
	int selectMemberTotal();
	
	Member selectMember(int memberNo);
	
	List<Book> selectBookList(int cPage, int numPerPage);
	
	int selectBookTotal();
	
	int insertBook(Book book, List<BookImage> bookImageList);
	
	Book selectBook(long isbn);
	
	List<BookImage> selectBookImageList(long isbn);
	
	int deleteFile(int imgNo);
	
	int updateBook(HashMap<String, Object> map, List<BookImage> bookImageList);
	
	int deleteBook(long isbn, String saveDirectory);
	
	int updateMemberType(int memberNo, String memberType);
	
}
