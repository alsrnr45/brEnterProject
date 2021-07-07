package com.brEnt.brFamily.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.mail.model.dao.MailDao;
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

}
