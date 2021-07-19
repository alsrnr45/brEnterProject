package com.brEnt.brFamily.phoneBook.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class PhoneBook {
	private int bookNo;
	private int memNo;
	private String bookName;
	private String bookEnrollDate;
}
