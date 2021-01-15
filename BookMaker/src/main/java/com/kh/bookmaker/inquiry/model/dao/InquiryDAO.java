package com.kh.bookmaker.inquiry.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.bookmaker.inquiry.model.vo.Inquiry;
import com.kh.bookmaker.inquiry.model.vo.InquiryFile;

public interface InquiryDAO {
	
	List<Map<String, String>> selectInquiryList(int cPage, int numPerPage);

	int selectInquiryTotalContents();

	int insertInquiry(Inquiry inquiry);
	
	int insertInquiryFile(InquiryFile a);

	Inquiry selectOneInquiry(int inquiryNo);

	List<InquiryFile> selectinquiryfileList(int inquiryNo);
	
	int updateReadCount(int inquiryNo);

	int updateInquiry(Inquiry inquiry);
	
	int updateInquiryFile(InquiryFile a);
	
	int deleteInquiry(int inquiryNo);
	
	int deleteInquiryFile(int inquiryNo);
	
	int deleteFile(int attNo);
	
	Inquiry updateView(int inquiryNo);
	
	int updateInquiry(Inquiry inquiry, List<InquiryFile> inquiryfile);
	
	
	
	
	


}
