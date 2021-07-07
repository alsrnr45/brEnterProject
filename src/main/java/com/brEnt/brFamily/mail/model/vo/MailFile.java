package com.brEnt.brFamily.mail.model.vo;

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
public class MailFile {
	private int mailFNo;
	private int mailNo;
	private String mailOrigin;
	private String mailUpdate;
	private String mailFPath;
	private String mailFSize;
	private String mailFType;
}
