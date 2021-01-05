package com.kh.bookmaker.book.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class Book {
	private long isbn;
	private String genreName;
	private String bookName;
	private String bookWriter;
	private String bookPublisher;
	private Date bookPublicationDate;
	private int bookPrice;
	private int bookSellPrice;
	private int bookPoint;
	private int bookPage;
	private int bookWeight;
	private String bookIntro;
	private String bookWriterIntro;
}
