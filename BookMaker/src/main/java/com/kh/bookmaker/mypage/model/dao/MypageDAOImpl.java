package com.kh.bookmaker.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookmaker.member.model.dao.MemberDAO;
import com.kh.bookmaker.mypage.model.vo.Member;

@Repository
public class MypageDAOImpl implements MypageDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Member selectOneMember(String memberId) {
		
		return sqlSession.selectOne("mypageMapper.mypageprof", memberId);
	}

	@Override 
	public List<Map<String, String>> selectmypageList(String memberId, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("mypageMapper.selectmypageList", memberId, rows);
	}

	@Override
	public int selectmypageTotalContents() {

		return sqlSession.selectOne("mypageMapper.selectmypageTotalContents");
	}
	
	
	
}