package com.kh.bookmaker.common.exception;

public class InquiryException extends RuntimeException {

	public InquiryException() {}
	
	public InquiryException(String message) {
		super("게시글 에러 : " + message);
	}
}
