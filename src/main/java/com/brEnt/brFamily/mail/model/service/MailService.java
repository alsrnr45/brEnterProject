package com.brEnt.brFamily.mail.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.mail.model.vo.ReceiveMail;
import com.brEnt.brFamily.mail.model.vo.SendMail;

public interface MailService {
	
	// 1. 받은 메일함 조회
	ArrayList<ReceiveMail> receiveMailListView(String email);
	
	// 2. 보낸 메일함 조회
	ArrayList<SendMail> sendMailListView(String email);
}
