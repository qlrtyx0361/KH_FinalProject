package com.kh.bookmaker.member.model.dao;

import java.util.HashMap;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookmaker.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
		
		return sqlSession.insert("memberMapper.insertMember", member);
	}

	@Override
	public Member selectOneMember(String userId) {
		
		return sqlSession.selectOne("memberMapper.loginMember", userId);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("memberMapper.updateMember", member);
	}

	@Override
	public int deleteMember(String userId) {
		
		return sqlSession.delete("memberMapper.deleteMember", userId);
	}

	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		// System.out.println("[before] hmap : " + hmap);
		
		sqlSession.selectOne("memberMapper.checkIdDuplicate", hmap);
		
		// System.out.println("[after] hmap : " + hmap);
		
		return (Integer)hmap.get("result");
	}

}
