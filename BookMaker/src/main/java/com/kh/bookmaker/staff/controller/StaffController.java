package com.kh.bookmaker.staff.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
				
				bookImageList.add(bi);
				
				if(level == 0) level++;
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
	public String selectBook(@RequestParam long isbn, Model model) {
		Book book = staffService.selectBook(isbn);
		
		List<BookImage> biList = staffService.selectBookImageList(isbn);
		
		model.addAttribute("b", book).addAttribute("biList", biList);
		
		return "staff/bookDetail";
	}
	
	@RequestMapping("/staff/bookUpdateForm.do")
	public String bookUpdateForm(@RequestParam long isbn, Model model) {
		Book book = staffService.selectBook(isbn);
		
		List<BookImage> biList = staffService.selectBookImageList(isbn);
		
		model.addAttribute("b", book).addAttribute("biList", biList);
		
		return "staff/bookUpdateForm";
	}
	
	@RequestMapping("/staff/bookUpdate.do")
	public String updateBook(Book book, Model model, HttpServletRequest req,
							@RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
		
		String saveDirectory = req.getServletContext().getRealPath("/resources/bookUpload");
		List<BookImage> bookImageList = new ArrayList<>();
		List<BookImage> originImageList = staffService.selectBookImageList(book.getIsbn()); 
		
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
				
				bookImageList.add(bi);
				
				for(BookImage img : originImageList) {
					if(img.getImageLevel() == level) {
						boolean check = staffService.deleteFile(img.getImageNo()) != 0 ? true : false;
						
						if(check) new File(saveDirectory + "/" + img.getFileName()).delete();
					}
				}
				
				if(level == 0) level++;
			}
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("b", book);
		
		int result = staffService.updateBook(map, bookImageList);
		
		String loc = "/staff/bookList.do";
		String msg = "";
		if(result > 0) {
			msg = "도서 수정 성공";
		} else {
			msg = "도서 수정 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/staff/bookDelete.do")
	public String deleteBook(@RequestParam long isbn, Model model, HttpServletRequest req) {
		String saveDirectory = req.getServletContext().getRealPath("/resources/bookUpload");
		
		int result = staffService.deleteBook(isbn, saveDirectory);
		
		String loc = "/staff/bookList.do";
		String msg = "";
		if(result > 0) {
			msg = "도서 삭제 성공";
		} else {
			msg = "도서 삭제 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/staff/fileDownload.do")
	public void fileDownload(@RequestParam String fileName, HttpServletRequest req, HttpServletResponse res) {
		
		String saveDirectory = req.getServletContext().getRealPath("/resources/bookUpload");	
		
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
			 
		try {
			sos = res.getOutputStream();
			File savedFile = new File(saveDirectory + "/" + fileName);
			res.setContentType("application/octet-stream; charset=utf-8");

			String resFilename = "";
			boolean isMSIE = req.getHeader("user-agent").indexOf("MSIE") != -1 
						  || req.getHeader("user-agent").indexOf("Trident") != -1;
			System.out.println("isMSIE="+isMSIE);
			if(isMSIE){
				resFilename = URLEncoder.encode(fileName, "UTF-8");
				System.out.println("ie : "+resFilename); //ie : %eb%82%98%eb%8a%94+%ec%a0%84%ec%84%a4%ec%9d%b4%eb%8b%a4.txt
									
				resFilename = resFilename.replaceAll("\\+", "%20");
				System.out.println("ie : "+resFilename); //ie : %eb%82%98%eb%8a%94%20%ec%a0%84%ec%84%a4%ec%9d%b4%eb%8b%a4.txt
			} else {
				resFilename = new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
				System.out.println("not ie : "+resFilename);
				
			}
			res.addHeader("Content-Disposition",
					"attachment; filename=\"" + resFilename + "\"");

			//파일크기지정
			res.setContentLength((int)savedFile.length());

			FileInputStream fis = new FileInputStream(savedFile);
			bis = new BufferedInputStream(fis);
			int read = 0;

			while ((read = bis.read()) != -1) {
				sos.write(read);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				sos.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}
	
	@ResponseBody
	@RequestMapping("/staff/fileDelete.do")
	public boolean fileDelete(@RequestParam int imgNo, @RequestParam String fileName, HttpServletRequest req) {

		String saveDirectory = req.getServletContext().getRealPath("/resources/bookUpload");
		
		boolean check = staffService.deleteFile(imgNo) != 0 ? true : false;
		
		if(check) {
			new File(saveDirectory + "/" + fileName).delete();
		}
		
		return check;
	}
	
	public String fileNameChanger(String oldFileName) {
		
		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd = (int)(Math.random() * 1000);

		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
	}
	
}
