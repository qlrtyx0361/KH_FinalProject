package com.kh.bookmaker.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.bookmaker.member.model.vo.Member;

public class StaffInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("member");
		
		if ( m == null ) {
			System.out.println("비 로그인 상태에서 [" + request.getRequestURI() + "] 접근!");
			
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "로그인하고 들어 오시게");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;
			
		} else if(!m.getMemberType().equals("STAFF")) {
			System.out.println("관리자 등급이 아닌 회원이 [" + request.getRequestURI() + "]에 접근하였습니다.");
			
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "관리자만 들어올 수 있습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

}
