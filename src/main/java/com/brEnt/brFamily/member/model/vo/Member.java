package com.brEnt.brFamily.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {

	private int memNo;
	private int deptNo;
	private int posiNo;
	private String id;
	private String pwd;
	private String officeEmail;
	private String personalEmail;
	private String memName;
	private String phone;
	private String post;
	private String roadAddress;
	private String detailAddress;
	private String memEnrollDate;
	private String hireDate;
	private String regi;
	private String bank;
	private String account;
	private String profile;
	private int offCount;
	private String acceptStatus;
	private String memStatus;
	private String adminStatus;
}
