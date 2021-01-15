package com.kh.bookmaker.inquiry.model.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookmaker.inquiry.model.vo.Inquiry;
import com.kh.bookmaker.inquiry.model.vo.InquiryFile;

@Repository
public class InquiryDAOImpl implements InquiryDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectInquiryList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("inquiryMapper.selectInquiryList", null, rows);
	}

	@Override
	public int selectInquiryTotalContents() {

		return sqlSession.selectOne("inquiryMapper.selectInquiryTotalContents");
	}

	@Override
	public int insertInquiry(Inquiry inquiry) {

		return sqlSession.insert("inquiryMapper.insertInquiry", inquiry);
	}

	@Override
	public int insertInquiryFile(InquiryFile a) {

		return sqlSession.insert("inquiryMapper.insertInquiryFile", a);
	}

	@Override
	public Inquiry selectOneInquiry(int inquiryNo) {

		return sqlSession.selectOne("inquiryMapper.selectOneInquiry", inquiryNo);
	}

	
	  @Override public List<InquiryFile> selectinquiryfileList(int inquiryNo) {
	 
		  
			return sqlSession.selectList("inquiryMapper.selectInquiryList2", inquiryNo);
	  }
	 

	@Override
	public int updateReadCount(int inquiryNo) {

		return sqlSession.update("inquiryMapper.updateReadCount", inquiryNo);
	}
	
	
	@Override
	public int updateInquiry(Inquiry inquiry) {
		
		return sqlSession.update("inquiryMapper.updateInquiry", inquiry);
	}
	
	@Override
	public int updateInquiryFile(InquiryFile a) {
		
		return sqlSession.insert("inquiryMapper.updateInquiryFile", a);
	}
	
	
	@Override
	public int deleteInquiryFile(int inquiryNo) {
		
		return sqlSession.delete("inquiryMapper.deleteInquiry", inquiryNo);
	}
	
	

	@Override
	public int updateInquiry(Inquiry inquiry, List<InquiryFile> inquiryfile) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	@Override
	public int deleteFile(int attNo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public Inquiry updateView(int inquiryNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int deleteInquiry(int inquiryNo) {
		
		return sqlSession.delete("inquiryMapper.deleteInquiry2", inquiryNo);
	}
	



}
