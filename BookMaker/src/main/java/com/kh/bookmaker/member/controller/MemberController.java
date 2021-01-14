package com.kh.bookmaker.member.controller;

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

//	@Autowired
//	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	private MemberService memberService;

	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {

		return "member/memberEnroll";
	}

	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, Model model) {

		System.out.println("memberEnroll : " + member);

		String plainPassword = member.getPassword();

//		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
//
//		System.out.println("원문 : " + plainPassword);
//		System.out.println("암호문 : " + encryptPassword);
//
//		member.setPassword(encryptPassword);

		try {
			// 1. 서비스를 통한 비즈니스 로직 수행
			int result = memberService.insertMember(member);

			// 2. 처리 결과에 따라 view 분기 처리
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

			// 기존의 예외를 우리가 지정한 예외 형식으로
			// 바꾸어 보내기 위해 MemberException을 호출한다.
			throw new MemberException(e.getMessage());
		}

		return "common/msg";

	}

	/*
	 * 로그인 프로세스 1. HttpSession 을 사용하는 방법 2. SessionAttribute 어노테이션을 사용하는 방법
	 */
	// 1번 방법
	/*
	 * @RequestMapping("/member/memberLogin.do") public String memberLogin(
	 * 
	 * @RequestParam String userId,
	 * 
	 * @RequestParam String password, HttpSession session, Model model ) {
	 * 
	 * System.out.println("로그인 기능 접근!");
	 * 
	 * Member m = memberService.selectOneMember(userId);
	 * 
	 * System.out.println("회원 조회 결과 : " + m);
	 * 
	 * String loc = "/"; String msg = "";
	 * 
	 * if( m == null) { msg = "존재하지 않는 아이디입니다."; } else {
	 * 
	 * if( bcryptPasswordEncoder.matches(password, m.getPassword())) {
	 * 
	 * msg = "로그인 성공!"; session.setAttribute("m", m);
	 * 
	 * } else { msg = "비밀번호가 틀렸습니다."; } }
	 * 
	 * model.addAttribute("loc", loc); model.addAttribute("msg", msg);
	 * 
	 * return "common/msg"; }
	 */

	// 2번 방법 (HttpSession 안쓰기!)
	/*
	 * @RequestMapping("/member/memberLogin.do") public String memberLogin(
	 * 
	 * @RequestParam String userId,
	 * 
	 * @RequestParam String password, Model model ) {
	 * 
	 * String loc = "/"; String msg = "";
	 * 
	 * Member m = memberService.selectOneMember(userId);
	 * 
	 * if ( m == null ) { msg = "존재하지 않는 아이디입니다."; } else { if(
	 * bcryptPasswordEncoder.matches(password, m.getPassword()) ) { msg =
	 * "로그인에 성공하였습니다!"; model.addAttribute("member", m); // @SessionAttributes 에 등록된
	 * 'member'로 인식하면서 // 자동으로 세션 영역에 해당 객체를 저장한다. } else { msg =
	 * "비밀번호가 일치하지 않습니다."; } }
	 * 
	 * model.addAttribute("msg", msg); model.addAttribute("loc", loc);
	 * 
	 * return "common/msg"; }
	 */

	/*
	 * // 3. 로그인 회원의 정보를 리턴 시 ModelAndView 객체로 함께 전달하기
	 * 
	 * @RequestMapping("/member/memberLogin.do") public ModelAndView memberLogin(
	 * 
	 * @RequestParam String userId,
	 * 
	 * @RequestParam String password) {
	 * 
	 * ModelAndView mv = new ModelAndView();
	 * 
	 * String loc = "/"; String msg = "";
	 * 
	 * Member m = memberService.selectOneMember(userId);
	 * 
	 * if ( m == null ) { msg = "존재하지 않는 아이디입니다."; } else { if(
	 * bcryptPasswordEncoder.matches(password, m.getPassword()) ) { msg =
	 * "로그인에 성공하였습니다!"; mv.addObject("member", m); // @SessionAttributes 에 등록된
	 * 'member'로 인식하면서 // 자동으로 세션 영역에 해당 객체를 저장한다. } else { msg =
	 * "비밀번호가 일치하지 않습니다."; } }
	 * 
	 * mv.addObject("msg", msg); mv.addObject("loc", loc);
	 * 
	 * mv.setViewName("common/msg");
	 * 
	 * return mv; }
	 * 
	 * @RequestMapping("/member/memberLogout.do") public String
	 * memberLogout(SessionStatus sessionStatus) {
	 * 
	 * // 현재 세션이 만료되었음을 // HttpSession 에서 invalidate() 메소드로 구현했다면 // SessionStatus 는
	 * .setComplete() 메소드로 구현한다.
	 * 
	 * if ( ! sessionStatus.isComplete() ) { sessionStatus.setComplete(); }
	 * 
	 * return "redirect:/"; }
	 * 
	 * @RequestMapping("/member/memberView.do") public String
	 * memberView(@RequestParam String userId, Model model) {
	 * 
	 * Member m = memberService.selectOneMember(userId);
	 * model.addAttribute("member", m);
	 * 
	 * return "member/memberView"; }
	 * 
	 * @RequestMapping("/member/memberUpdate.do") public String memberUpdate(Member
	 * member, Model model) {
	 * 
	 * // 1. 서비스 로직 수행 int result = memberService.updateMember(member);
	 * 
	 * // 2. 처리 결과에 따른 화면 분리 String loc="/"; String msg = "";
	 * 
	 * if( result > 0 ) { msg = "회원 정보 수정~!"; model.addAttribute("member", member);
	 * } else { msg = "회원 정보 수정 실패..ㅠㅠ"; }
	 * 
	 * model.addAttribute("loc", loc); model.addAttribute("msg", msg);
	 * 
	 * return "common/msg"; }
	 * 
	 * @RequestMapping("/member/memberDelete.do") public String
	 * memberDelete(SessionStatus sessionStatus, Model model, Member member) {
	 * 
	 * int result = memberService.deleteMember(member.getUserId());
	 * 
	 * if( result > 0 ) sessionStatus.setComplete();
	 * 
	 * String loc = "/"; String msg = "";
	 * 
	 * if( result > 0 ) msg = "회원 탈퇴 성공!!"; else msg = "회원 탈퇴 실패!";
	 * 
	 * model.addAttribute("loc", loc); model.addAttribute("msg", msg);
	 * 
	 * return "common/msg"; }
	 * 
	 *//************* Spring ajax ****************//*
													 * 
													 * // 1. 일반 문자열 처리 ( Stream 방식 )
													 * 
													 * @RequestMapping("/member/checkIdDuplicate.do") public void
													 * checkIdDuplicate(@RequestParam String userId, HttpServletResponse
													 * res) throws IOException {
													 * 
													 * int check = memberService.checkIdDuplicate(userId);
													 * 
													 * boolean isUsable = (check == 0 ? true : false);
													 * 
													 * res.getWriter().print(isUsable); }
													 * 
													 * 
													 * // 2. Json 전용 ViewResolver를 등록하여 처리하기
													 * 
													 * @RequestMapping("/member/checkIdDuplicate.do") public String
													 * jsonViewCheckIdDup(@RequestParam String userId, Model model) {
													 * 
													 * Map map = new HashMap();
													 * 
													 * int result = memberService.checkIdDuplicate(userId); boolean
													 * isUsable = (result == 0 ? true : false);
													 * 
													 * map.put("isUsable", isUsable);
													 * 
													 * model.addAllAttributes(map);
													 * 
													 * return "jsonView"; }
													 * 
													 * 
													 * // 3. @ResponseBody 사용하기
													 * 
													 * @RequestMapping("/member/checkIdDuplicate.do")
													 * 
													 * @ResponseBody public Map<String, Object>
													 * checkIdDuplicate(@RequestParam String userId){
													 * 
													 * Map<String, Object> map = new HashMap<String, Object>(); boolean
													 * isUsable = memberService.checkIdDuplicate(userId) == 0 ? true :
													 * false;
													 * 
													 * map.put("isUsable", isUsable);
													 * 
													 * return map; }
													 */
}
