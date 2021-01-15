package com.kh.bookmaker.member.controller;

import java.sql.Date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bookmaker.common.exception.MemberException;
import com.kh.bookmaker.member.model.service.MemberService;
import com.kh.bookmaker.member.model.vo.Member;

@SessionAttributes(value = { "member" })
@Controller
public class MemberController {

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	private MemberService memberService;

	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		
		

		return "member/memberEnroll";
	}

	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, Model model,
			@RequestParam("birthDay") String[] birthDay){

		Date birth = Date.valueOf(String.join("-", birthDay));
		member.setBirth(birth);
		
		
		String plainPassword = member.getPassword();

		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);

		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " + encryptPassword);

		member.setPassword(encryptPassword);

		try {
		
			int result = memberService.insertMember(member);


			String loc = "/";
			String msg = "";

			if (result > 0)
				msg = "회원가입 성공!";
			else
				msg = "회원가입 실패!";

			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			System.out.println("회원 가입 에러 발생!!");


			throw new MemberException(e.getMessage());
		}

		return "common/msg";

	}
	@RequestMapping("/member/memberLogin.do")
	public ModelAndView memberLogin(
				@RequestParam String memberId,
				@RequestParam String password) {
		
		ModelAndView mv = new ModelAndView();
		
		String loc = "/";
		String msg = "";
		
		Member m = memberService.selectOneMember(memberId);
		
		if ( m == null ) {
			msg = "존재하지 않는 아이디입니다.";
		} else {
			if( bcryptPasswordEncoder.matches(password, m.getPassword()) ) {
				msg = "로그인에 성공하였습니다!";
				mv.addObject("member", m);
			
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
			}
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}

	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus) {
		
		
		
		if ( ! sessionStatus.isComplete() ) {
			sessionStatus.setComplete();
		}
		
		return "redirect:/";
	}
	
	
	@RequestMapping("/member/memberView.do")
	public String memberView(@RequestParam String memberId, Model model) {
		
		Member m = memberService.selectOneMember(memberId);
		model.addAttribute("member", m);
	
		
		return "member/memberView";
	}
	
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdate(Member member, Model model) {
		
		
		int result = memberService.updateMember(member);
		
		
		String loc="/";
		String msg = "";
		
		if( result > 0 ) {
			msg = "회원 정보 수정 완료~!";
			model.addAttribute("member", member);
		} else {
			msg = "회원 정보 수정 실패..ㅠㅠ";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(SessionStatus sessionStatus, Model model, Member member) {
		
		int result = memberService.deleteMember(member.getMemberId());
		
		if( result > 0 ) sessionStatus.setComplete();
		
		String loc = "/";
		String msg = "";
		
		if( result > 0 ) msg = "회원 탈퇴 성공!!";
		else msg = "회원 탈퇴 실패!";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
	@RequestMapping("/member/checkIdDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkIdDuplicate(@RequestParam String memberId){
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable
		   = memberService.checkIdDuplicate(memberId) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
				
		return map;
	}
}
