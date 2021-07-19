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
public class PrivatePhoneBook {
	private int bookNo;
	private int memNo;
	private String company;
	private String dept_name;
	private String email;
	private String name;
	private String phone;
}
