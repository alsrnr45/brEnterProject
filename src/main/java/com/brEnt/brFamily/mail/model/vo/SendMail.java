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

	

	
	// mfIsHave = 0 : 첨부파일 없음
	// mfIsHave > 0 : 첨부파일 있음
	private String mfIsHave;
}
