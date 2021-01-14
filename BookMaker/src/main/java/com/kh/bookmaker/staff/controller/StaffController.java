package com.kh.bookmaker.staff.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bookmaker.book.model.service.BookService;
import com.kh.bookmaker.book.model.service.BookServiceImpl;
import com.kh.bookmaker.book.model.vo.BookImage;
import com.kh.bookmaker.book.model.vo.Book;
import com.kh.bookmaker.common.util.Utils;
import com.kh.bookmaker.member.model.vo.Member;
import com.kh.bookmaker.staff.model.service.StaffService;

@Controller
public class StaffController {
	
	@Autowired
	private StaffService staffService;
	
	@RequestMapping("/staff/memberList.do")
	public String selectMemberList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
		
		List<Member> list = staffService.selectMemberList(cPage, numPerPage);
		
		int total = staffService.selectMemberTotal();
		
		String pageBar = Utils.getPageBar(total, cPage, numPerPage, "memberList.do");
		
		model.addAttribute("list", list).addAttribute("pageBar", pageBar);
		
		return "staff/memberList";
	}
	
	@RequestMapping("/staff/memberDetail.do")
	public String selectMember(@RequestParam("memberNo") int memberNo, Model model) {
		
		Member m = staffService.selectMember(memberNo);
		
		model.addAttribute("m", m);
		
		return "staff/memberDetail";
	}
	
	@RequestMapping("/staff/bookList.do")
	public String selectBookList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
		
		List<Book> list = staffService.selectBookList(cPage, numPerPage);
		
		int totalContents = staffService.selectBookTotal();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "bookList.do");
		
		model.addAttribute("list", list).addAttribute("pageBar", pageBar);
		
		return "staff/bookList";
	}
	
	@RequestMapping("/staff/bookInsertForm.do")
	public String insertForm() {
		return "staff/bookInsertForm";
	}
	
	@RequestMapping("/staff/bookInsert.do")
	public String insertBook(Book book, HttpServletRequest req, Model model,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
		
		String saveDirectory = req.getServletContext().getRealPath("/resources/bookUpload");
		List<BookImage> bookImageList = new ArrayList<>();
		
		int level = 0;
		
		for(MultipartFile f : upFiles) {
			if(!f.isEmpty()) {
				String changeName = fileNameChanger(f.getOriginalFilename());
				
				try {
					f.transferTo(new File(saveDirectory + "/" + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				BookImage bi = new BookImage();
				bi.setIsbn(book.getIsbn());
				bi.setFileName(changeName);
				bi.setImageLevel(level);
				
				if(level == 0) level++;
				
				bookImageList.add(bi);
			}
		}
		
		int result = staffService.insertBook(book, bookImageList);
		
		String loc = "/staff/bookList.do";
		String msg = "";
		if(result > 0) {
			msg = "도서 등록 성공";
		} else {
			msg = "도서 등록 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/staff/bookDetail.do")
	public String selectBook() {
		
		return "staff/bookDetail";
	}
	
	public String fileNameChanger(String oldFileName) {
		
		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd = (int)(Math.random() * 1000);

		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
	}
	
}
