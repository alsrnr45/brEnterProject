package com.brEnt.brFamily.mail.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.mail.model.vo.ReceiveMail;
import com.brEnt.brFamily.mail.model.vo.SendMail;

@Repository
public class MailDao {

	public ArrayList<ReceiveMail> receiveMailListView(String email, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("mailMapper.receiveMailListView", email);
	}

	public ArrayList<SendMail> sendMailListView(String email, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("mailMapper.sendMailListView", email);
	}

}
