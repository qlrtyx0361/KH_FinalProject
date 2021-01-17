package com.kh.bookmaker.index.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bookmaker.book.model.vo.Book;
import com.kh.bookmaker.index.model.service.IndexService;

@Controller
public class IndexController {

	@Autowired
	private IndexService indexService;
	
	@RequestMapping("/index.do")
	public String index(Model model) {
		
		int numPerPage = 6;
		
		List<Book> list = indexService.selectBookList(numPerPage);
		
		model.addAttribute("list", list);
		
		return "index";
	}
	
}
