package com.kh.bookmaker.common.exception;

public class NoticeException extends RuntimeException {

	public NoticeException() {}
	
	public NoticeException(String message) {
		super("게시글 에러 : " + message);
	}
}
