package com.brEnt.brFamily.mail.model.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.brEnt.brFamily.mail.model.vo.MailFile;
import com.brEnt.brFamily.mail.model.vo.ReceiveMail;
import com.brEnt.brFamily.mail.model.vo.SendMail;

public interface MailService {
	
	// 1. 받은 메일함 조회
	ArrayList<ReceiveMail> receiveMailListView(String email);
	
	// 2. 보낸 메일함 조회
	ArrayList<SendMail> sendMailListView(String email);
	ArrayList<ReceiveMail> receiverList(String email);
	
	// 3. 임시보관함 조회
	ArrayList<SendMail> TempboxListView(String email);
	
	// 4. 휴지통 조회
	ArrayList<SendMail> recycleBinList(String email);
	ArrayList<ReceiveMail> recycleBinRList(String email);
	
	// 5. 메일 보내기
	int insertSMail(SendMail s);
	int insertRMail(ArrayList<ReceiveMail> rlist);
	int insertMFMail(MailFile mf);
	
	// 6. 메일 임시저장
	int tempSMail(SendMail s);
	int tempRMail(ArrayList<ReceiveMail> rlist);
	int tempMFMail(MailFile mf);
	
	// 메일 삭제
	int deleteMail(String[] mail_arr, String email);


	
	
	
}
