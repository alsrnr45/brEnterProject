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
public class SendMail {
	
	private int mailNo;
	private int memNo;
	private String mailWriter;
	private String mailReceiver;
	private String mailTitle;
	private String mailContent;
	private String mailSendDate;
	private String tempBox;

	
	// receiveStatus = 메일 받은 사람 숫자
	// receiveYCount = 메일 읽은 사람 숫자
	private String receiverCount;
	private String receiveStatusYCount;
	private String receiveStatus;
	
	// mfIsHave = 0 : 첨부파일 없음
	// mfIsHave > 0 : 첨부파일 있음
	private String mfIsHave;
}
