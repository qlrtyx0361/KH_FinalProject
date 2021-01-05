package com.kh.bookmaker.member.model.service;

import com.kh.bookmaker.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	Member selectOneMember(String userId);

	int updateMember(Member member);

	int checkIdDuplicate(String userId);

	int deleteMember(String userId);
}
