package com.brEnt.brFamily.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.mail.model.dao.MailDao;
import com.brEnt.brFamily.mail.model.vo.InfoMail;
import com.brEnt.brFamily.mail.model.vo.MailFile;
import com.brEnt.brFamily.mail.model.vo.ReceiveMail;
import com.brEnt.brFamily.mail.model.vo.SendMail;

@Service
public class MailServiceImpl implements MailService {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MailDao mDao;

	@Override
	public ArrayList<ReceiveMail> receiveMailListView(String email) {
		
		return mDao.receiveMailListView(email, sqlSession);
	}

	@Override
	public ArrayList<SendMail> sendMailListView(String email) {
		
		return mDao.sendMailListView(email, sqlSession);
	}

	@Override
	public ArrayList<ReceiveMail> receiverList(String email) {
		return mDao.receiverList(email, sqlSession);
	}

	@Override
	public ArrayList<SendMail> TempboxListView(String email) {
		return mDao.TempboxListView(email, sqlSession);
	}

	@Override
	public ArrayList<SendMail> recycleBinList(String email) {
		return mDao.recycleBinList(email, sqlSession);
	}

	@Override
	public ArrayList<ReceiveMail> recycleBinRList(String email) {
		return mDao.recycleBinRList(email, sqlSession);
	}

	@Override
	public int insertSMail(SendMail s) {
		return mDao.insertSMail(s, sqlSession);
	}

	@Override
	public int insertRMail(ArrayList<ReceiveMail> rlist) {
		return mDao.insertRMail(rlist, sqlSession);
	}


	@Override
	public int insertMFMail(MailFile mf) {
		return mDao.insertMFMail(mf, sqlSession);
	}

	@Override
	public int tempSMail(SendMail s) {
		return mDao.tempSMail(s, sqlSession);
	}

	@Override
	public int tempRMail(ArrayList<ReceiveMail> rlist) {
		return mDao.tempRMail(rlist, sqlSession);
	}

	@Override
	public int tempMFMail(MailFile mf) {
		return mDao.tempMFMail(mf, sqlSession);
	}

	@Override
	public int deleteMail(String[] mail_arr, String email) {
		return mDao.deleteMail(mail_arr, email, sqlSession);
	}
	
	@Override
	public int readMail(ReceiveMail rmail) {
		return mDao.readMail(rmail, sqlSession);
	}

	@Override
	public InfoMail detailRMail(ReceiveMail rmail) {
		
		return mDao.detailRMail(rmail, sqlSession);
	}




}
