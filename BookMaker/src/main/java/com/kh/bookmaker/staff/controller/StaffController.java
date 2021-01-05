package com.kh.bookmaker.staff.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bookmaker.book.model.vo.Book;

@Controller
public class StaffController {
	
	@RequestMapping("/staff/bookInsertForm.do")
	public String insertForm() {
		return "staff/bookInsertForm";
	}
	
	@RequestMapping("/staff/bookInsert.do")
	public String insertBook(Book book, HttpServletRequest request,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
		
		return "staff/bookList";
	}
	
}
