package com.kh.bookmaker.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmaker.mypage.model.vo.Member;
import com.kh.bookmaker.mypage.model.dao.MypageDAO;


@Service
public class MypageServiceImpl implements MypageService  {
	
		@Autowired
		MypageDAO mypageDAO;
		
		@Override
		public Member selectOneMember(String memberId) {
		
			return mypageDAO.selectOneMember(memberId);
		}


		@Override
		public List<Map<String, String>> selectmypageList(String memberId, int cPage, int numPerPage) {
			
			return  mypageDAO.selectmypageList(memberId, cPage, numPerPage);
		}

		@Override
		public int selectmypageTotalContents() {
			
			return mypageDAO.selectmypageTotalContents();
		}
		
		

}
