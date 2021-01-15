package com.kh.bookmaker.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bookmaker.mypage.model.vo.Member;

public interface MypageService {
	
	
	Member selectOneMember(String userId);
	
	List<Map<String, String>> selectmypageList(String memberId, int cPage, int numPerPage);

	int selectmypageTotalContents();

}
