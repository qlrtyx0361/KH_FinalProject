package com.kh.bookmaker.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bookmaker.book.model.vo.Book;
import com.kh.bookmaker.common.exception.NoticeException;
import com.kh.bookmaker.common.util.Utils;
import com.kh.bookmaker.notice.model.service.NoticeService;
import com.kh.bookmaker.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/notice/noticeList.do")
	public String selectNoticeList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		int numPerPage = 10;
		
		List<Notice> list = noticeService.selectNoticeList(cPage, numPerPage);
		
		int total = noticeService.selectNoticeTotal();
		
		String pageBar = Utils.getPageBar(total, cPage, numPerPage, "noticeList.do");
		
		model.addAttribute("list", list).addAttribute("pageBar", pageBar);
		
		return "notice/noticeList";
	}
	
	@RequestMapping("/notice/noticeDetail.do")
	public String selectNotice(@RequestParam int noticeNo, Model model) {
		Notice n = noticeService.selectNotice(noticeNo);
		
		int result = updateCount(noticeNo);
		
		if(result > 0) {
			n.setNoticeCount(n.getNoticeCount() + 1);
		} else {
			throw new NoticeException("공지 불러오기 실패");
		}
		
		model.addAttribute("n", n);
		
		return "notice/noticeDetail";
	}
	
	public int updateCount(int noticeNo) {
		return noticeService.updateCount(noticeNo);
	}
	
	@RequestMapping("/notice/noticeInsertForm.do")
	public String insertForm() {
		return "notice/noticeInsertForm";
	}
	
	@RequestMapping("/notice/noticeInsert.do")
	public String insertNotice(Notice notice, HttpServletRequest req, Model model) {
		int result = noticeService.insertNotice(notice);
		
		String loc = "/notice/noticeList.do";
		String msg = "";
		if(result > 0) {
			msg = "공지 등록 성공";
		} else {
			msg = "공지 등록 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/notice/noticeUpdateForm.do")
	public String noticeUpdateForm(@RequestParam int noticeNo, Model model) {
		model.addAttribute("n", noticeService.selectNotice(noticeNo));
		
		return "notice/noticeUpdateForm";
	}
	
	@RequestMapping("/notice/noticeUpdate.do")
	public String updateNotice(Notice notice, Model model, HttpServletRequest req) {
		int result = noticeService.updateNotice(notice);
		
		String loc = "/notice/noticeList.do";
		String msg = "";
		if(result > 0) {
			msg = "도서 수정 성공";
		} else {
			msg = "도서 수정 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/notice/noticeDelete.do")
	public String deleteNotice(@RequestParam int noticeNo, Model model) {
		int result = noticeService.deleteNotice(noticeNo);
		
		String loc = "/notice/noticeList.do";
		String msg = "";
		if(result > 0) {
			msg = "공지 삭제 성공";
		} else {
			msg = "공지 삭제 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
}
