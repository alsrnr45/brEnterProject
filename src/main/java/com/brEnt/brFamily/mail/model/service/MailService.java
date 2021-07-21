package com.brEnt.brFamily.mail.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	int deleteMail(Map<String, Object> map);
	
	// 메일조회
	int readMail(ReceiveMail rmail); // 받은 메일 수신시, 읽음표시
	ReceiveMail detailRMail(ReceiveMail rmail);
	ArrayList<MailFile> detailMFMail(ReceiveMail rmail);
	
	// 보낸 메일 조회
	SendMail detailSMail(SendMail smail);
	ArrayList<MailFile> detailMFMail(SendMail smail);
	
	//즐겨찾기 추가
	int updateImpor(ReceiveMail r);
	
	//즐겨찾기 리스트 조회
	ArrayList<ReceiveMail> imporListView(ReceiveMail r);
	
	//메일 답장
	ReceiveMail reply(ReceiveMail r);
	ArrayList<MailFile> replyMF(ReceiveMail r);
	
	// 메일 전달
	ReceiveMail forwardMail(ReceiveMail r);
	ArrayList<MailFile> forwarMFMail(ReceiveMail r);
	
	// 보낸메일 전달
	SendMail forwardSMail(SendMail s);
	ArrayList<MailFile> forwarMFSMail(SendMail s);
	
	// 임시보관 메일 삭제
	int deleteTMail(Map<String, Object> map);
	
	// 완전 삭제
	int ttDeleteMail(Map<String, Object> map);




	
	
	
}
