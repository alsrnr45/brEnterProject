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
public class ReceiveMail {
	private int mailNo;
	private String mailWriter;
	private String mailReceiver;
	private String recycleBinStatus;
	private String receiveStatus;
	private String bookmark;
	
	private String mailTitle;
	private String mailSendDate;
	private String mailContent;
	
	private int mailFNo;
	private String mailFSize;
	
	// mfIsHave = 0 : 첨부파일 없음
	// mfIsHave > 0 : 첨부파일 있음
	private String mfIsHave;
	
	// receiveStatus = 메일 받은 사람 숫자
	// receiveYCount = 메일 읽은 사람 숫자
	private String receiverCount;
	private String receiverYCount;
}
