package com.kh.bookmaker.common.exception;

public class BookException extends RuntimeException {

	public BookException() {}
	
	public BookException(String message) {
		super("게시글 에러 : " + message);
	}
}

