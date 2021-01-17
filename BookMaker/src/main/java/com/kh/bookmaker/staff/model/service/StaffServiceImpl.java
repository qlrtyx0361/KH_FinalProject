package com.kh.bookmaker.staff.model.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmaker.book.model.vo.Book;
import com.kh.bookmaker.book.model.vo.BookImage;
import com.kh.bookmaker.common.exception.BookException;
import com.kh.bookmaker.member.model.vo.Member;
import com.kh.bookmaker.staff.model.dao.StaffDAO;

@Service
public class StaffServiceImpl implements StaffService {
	
	@Autowired
	private StaffDAO staffDAO;

	@Override
	public List<Member> selectMemberList(int cPage, int numPerPage) {
		return staffDAO.selectMemberList(cPage, numPerPage);
	}

	@Override
	public int selectMemberTotal() {
		return staffDAO.selectMemberTotal();
	}

	@Override
	public Member selectMember(int memberNo) {
		return staffDAO.selectMember(memberNo);
	}

	@Override
	public List<Book> selectBookList(int cPage, int numPerPage) {
		return staffDAO.selectBookList(cPage, numPerPage);
	}

	@Override
	public int selectBookTotal() {
		return staffDAO.selectBookTotal();
	}

	@Override
	public int insertBook(Book book, List<BookImage> bookImageList) {
		int result1 = staffDAO.insertBook(book);
		if(result1 == 0) throw new BookException();
		
		if(bookImageList.size() > 0) {
			for(BookImage bi : bookImageList) {
				int result2 = staffDAO.insertBookImage(bi);
				if(result2 == 0) throw new BookException("첨부파일 추가 실패!");
			}
		}
		
		return result1;
	}

	@Override
	public Book selectBook(long isbn) {
		return staffDAO.selectBook(isbn);
	}

	@Override
	public List<BookImage> selectBookImageList(long isbn) {
		return staffDAO.selectBookImageList(isbn);
	}

	@Override
	public int deleteFile(int imgNo) {
		return staffDAO.deleteFile(imgNo);
	}

	@Override
	public int updateBook(HashMap<String, Object> map, List<BookImage> bookImageList) {
		int result1 = staffDAO.updateBook(map);
		if(result1 == 0) throw new BookException();
		
		if(bookImageList.size() > 0) {
			for(BookImage bi : bookImageList) {
				int result2 = staffDAO.insertBookImage(bi);
				if(result2 == 0) throw new BookException("첨부파일 추가 실패!");
			}
		}
		
		return result1;
	}

	@Override
	public int deleteBook(long isbn, String saveDirectory) {
		
		List<BookImage> bookImageList = staffDAO.selectBookImageList(isbn);
		
		int result = staffDAO.deleteBook(isbn);
		
		if(result == 0) {
			throw new BookException();
		} else {
			for(BookImage bi : bookImageList) {
				new File(saveDirectory + "/" + bi.getFileName()).delete();
			}
		} 
		
		return result;
	}

	@Override
	public int updateMemberType(int memberNo, String memberType) {
		return staffDAO.updateMemberType(memberNo, memberType);
	}

}
