package com.kh.bookmaker.inquiry.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bookmaker.inquiry.model.vo.Inquiry;
import com.kh.bookmaker.inquiry.model.vo.InquiryAnswer;
import com.kh.bookmaker.inquiry.model.vo.InquiryAnswerFile;
import com.kh.bookmaker.inquiry.model.vo.InquiryFile;


public interface InquiryService {

	List<Map<String, String>> selectInquiryList(int cPage, int numPerPage);

	int selectInquiryTotalContents();

	int insertInquiry(Inquiry inquiry, List<InquiryFile> inquiryFile);

	Inquiry selectOneInquiry(int inquiryNo);

	List<InquiryFile> selectinquiryfileList(int inquiryNo);

	Inquiry updateView(int inquiryNo);
	
	int updateInquiry(Inquiry inquiry, List<InquiryFile> inquiryfile);
	
	int deleteInquiry(int inquiryNo);

	int deleteFile(int attNo);
	
	int inquiryAnswerok(InquiryAnswer inquiryAnswer, List<InquiryAnswerFile> inquiryAnswerFile);
	
	InquiryAnswer answerView(int inquiryNo);
	
	/* List<InquiryFile> answerViewfile(String memberId); */
	
	
}
