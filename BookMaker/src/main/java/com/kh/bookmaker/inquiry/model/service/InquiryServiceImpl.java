package com.kh.bookmaker.inquiry.model.service;

import java.util.List;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bookmaker.common.exception.InquiryException;
import com.kh.bookmaker.inquiry.model.dao.InquiryDAO;
import com.kh.bookmaker.inquiry.model.vo.InquiryFile;

import com.kh.bookmaker.inquiry.model.vo.Inquiry;
import com.kh.bookmaker.inquiry.model.vo.InquiryAnswer;
import com.kh.bookmaker.inquiry.model.vo.InquiryAnswerFile;


@Service
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	InquiryDAO inquiryDAO;
	
	@Override
	public List<Map<String, String>> selectInquiryList(int cPage, int numPerPage) {
		
		return inquiryDAO.selectInquiryList(cPage, numPerPage);
	}

	@Override
	public int selectInquiryTotalContents() {
		
		return inquiryDAO.selectInquiryTotalContents();
	}

	@Override
	public int insertInquiry(Inquiry inquiry, List<InquiryFile> inquiryFile) {
		int result1 = inquiryDAO.insertInquiry(inquiry);
		
		if( result1 == 0 ) throw new InquiryException();
	
		
		if(inquiryFile.size() > 0) { // 게시글의 첨부파일이 있다면 실행해라!
			for(InquiryFile a : inquiryFile) {
				int result2 = inquiryDAO.insertInquiryFile(a);
				if( result2 == 0 ) throw new InquiryException("첨부파일 추가 실패!");
			}
		}
		
		return result1;
	
	}

	@Override
	public Inquiry selectOneInquiry(int inquiryNo) {
		
		Inquiry inquiry = inquiryDAO.selectOneInquiry(inquiryNo);
		
		if( inquiry != null) inquiryDAO.updateReadCount(inquiryNo);
		
		return inquiry;
	}

	@Override
	public List<InquiryFile> selectinquiryfileList(int inquiryNo) {
		
		
		return inquiryDAO.selectinquiryfileList(inquiryNo);
	}

	@Override//수정하기 눌렀을때 쭈르륵 뜨는 화면(저장된 기본정보들)
	public Inquiry updateView(int inquiryNo) {
		
		return inquiryDAO.selectOneInquiry(inquiryNo);
	}

	@Override
	public int updateInquiry(Inquiry inquiry, List<InquiryFile> inqFileList) {
		int totalResult = 0;
		
		List<InquiryFile> originList = inquiryDAO.selectinquiryfileList(inquiry.getInquiryNo());
		
		totalResult = inquiryDAO.updateInquiry(inquiry);
		
		if(totalResult == 0) throw new InquiryException("게시글 수정 실패!");
		
		// 이전 첨부파일이 있다면, DB의 이전 파일 기록을 삭제하기
		if( originList.size() > 0 ) {
			totalResult = inquiryDAO.deleteInquiryFile(inquiry.getInquiryNo());
			
			if(totalResult == 0) throw new InquiryException("첨부 파일 삭제 실패!");
		}
		
		// 이전의 첨부파일은 없고, 새로 추가한 첨부파일이 있다면
		if( inqFileList.size() > 0) {
			for(InquiryFile a : inqFileList) {
				 // update라고 쓰지만, SQL은 insert로!
				totalResult = inquiryDAO.updateInquiryFile(a);
				
				if( totalResult == 0 ) throw new InquiryException("첨부파일 추가 실패!");
			}
		}
		
		return totalResult;
	}

	@Override
	public int deleteInquiry(int inquiryNo) {
		
		return inquiryDAO.deleteInquiry(inquiryNo);
	}



	@Override
	public int deleteFile(int attNo) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public InquiryAnswer answerView(int inquiryNo) {
		
		return inquiryDAO.answerView(inquiryNo);
	}

	@Override
	public int inquiryAnswerok(InquiryAnswer inquiryAnswer, List<InquiryAnswerFile> inquiryAnswerFile) {
int result1 = inquiryDAO.inquiryAnswerok(inquiryAnswer);
		
		if( result1 == 0 ) throw new InquiryException();
	
		
		if(inquiryAnswerFile.size() > 0) { // 게시글의 첨부파일이 있다면 실행해라!
			for(InquiryAnswerFile a : inquiryAnswerFile) {
				int result2 = inquiryDAO.inquiryAnswerFile(a); // 있다면 그 게시물을 dao 에게 보내라 
				if( result2 == 0 ) throw new InquiryException("첨부파일 추가 실패!");
			}
		}
		
		return result1;
	}

	/*
	 * @Override public List<InquiryFile> answerViewfile(String memberId) {
	 * 
	 * return inquiryDAO.answerViewfile(memberId); }
	 */



}
