package com.kh.bookmaker.mypage.model.dao;


import java.util.List;
import java.util.Map;
import com.kh.bookmaker.mypage.model.vo.Member;

public interface MypageDAO {
	
	Member selectOneMember(String memberId);
	
	List<Map<String, String>> selectmypageList(String memberId, int cPage, int numPerPage);

	int selectmypageTotalContents();

}
