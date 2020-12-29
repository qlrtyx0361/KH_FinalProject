package com.kh.bookmaker.member.model.dao;

import java.util.HashMap;


import com.kh.bookmaker.member.model.vo.Member;

public interface MemberDAO {
	
	int insertMember(Member member);

	Member selectOneMember(String userId);

	int updateMember(Member member);

	int deleteMember(String userId);
	
	int checkIdDuplicate(HashMap<String, Object> hmap);
}
