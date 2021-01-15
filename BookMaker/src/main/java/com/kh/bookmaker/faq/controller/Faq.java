package com.kh.bookmaker.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Faq {
	
	@RequestMapping("/Faq/Faq.do")
	public String faqForm() {
		
		
		return "faq/faq";
	}

}
