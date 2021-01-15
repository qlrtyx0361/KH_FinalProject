package com.kh.bookmaker.mypage.controller;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bookmaker.common.util.Utils;
import com.kh.bookmaker.inquiry.model.service.InquiryService;
import com.kh.bookmaker.mypage.model.vo.Member;
import com.kh.bookmaker.mypage.model.service.MypageService;

@Controller
public class MypageController {
	

		@Autowired
		MypageService mypageService;
		
		@RequestMapping("/mypage/mypageView.do")
		public void mypageView() {
			
		}
		
		@RequestMapping("/mypage/mypageprof.do")
		public String mypageprof(@RequestParam String memberId, Model model) {
			
			Member m = mypageService.selectOneMember(memberId);
			model.addAttribute("member", m);
		
			
			return "mypage/mypageProf";
		}
		
		@RequestMapping("/mypage/mypageUpdateView.do")
		public String mypageupdateview(@RequestParam String memberId, Model model) {
			
			Member m = mypageService.selectOneMember(memberId);
			model.addAttribute("member", m);
		
			
			return "mypage/mypageUpdateView";
		

}
		
		@RequestMapping("/mypage/mypageinquiry.do")
			public String mypageinquiry(String memberId,
					@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
			int numPerPage = 10;
			
			
			List<Map<String, String>> list = mypageService.selectmypageList(memberId, cPage, numPerPage);
			
			
			int totalContents = mypageService.selectmypageTotalContents();
			

			String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "mypageinquiry.do", memberId);
			
			System.out.println("list : " + list);
			
			model.addAttribute("list", list);
			model.addAttribute("totalContents", totalContents);
			model.addAttribute("numPerPage", numPerPage);
			model.addAttribute("pageBar", pageBar);
			
			return "mypage/mypageInquiry";
			

		
		}
	
			
			
}
