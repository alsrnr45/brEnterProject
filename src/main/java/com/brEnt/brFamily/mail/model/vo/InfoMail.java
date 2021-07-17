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
public class InfoMail {
	
	private int mailNo;
	private String mailWriter;
	private String mailReceiver;
	private String recycleBinStatus;
	private String receiveStatus;
	private String bookmark;
	
	private int memNo;
	private String mailTitle;
	private String mailContent;
	private String mailSendDate;
	private String tempBox;
	
	private int mailFNo;
	private String mailOrigin;
	private String mailUpdate;
	private String mailFPath;
	private String mailFSize;
	private String mailFType;
}
