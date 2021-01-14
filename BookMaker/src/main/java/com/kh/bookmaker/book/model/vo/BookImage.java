package com.kh.bookmaker.book.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class BookImage {
	private int imageNo;
	private long isbn;
	private String fileName;
	private int imageLevel;
}
