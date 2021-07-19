package com.brEnt.brFamily.mail.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.mail.model.vo.InfoMail;
import com.brEnt.brFamily.mail.model.vo.MailFile;
import com.brEnt.brFamily.mail.model.vo.ReceiveMail;
import com.brEnt.brFamily.mail.model.vo.SendMail;
import com.google.gson.JsonElement;

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
	
	// 메일조회
	int readMail(ReceiveMail rmail); // 받은 메일 수신시, 읽음표시
	ReceiveMail detailRMail(ReceiveMail rmail);
	ArrayList<MailFile> detailMFMail(ReceiveMail rmail);
	
	//즐겨찾기 추가
	int updateImpor(ReceiveMail r);
	
	//즐겨찾기 리스트 조회
	ArrayList<ReceiveMail> imporListView(ReceiveMail r);
	
	//메일 답장
	ReceiveMail reply(ReceiveMail r);
	ArrayList<MailFile> replyMF(ReceiveMail r);



	
	
	
}
