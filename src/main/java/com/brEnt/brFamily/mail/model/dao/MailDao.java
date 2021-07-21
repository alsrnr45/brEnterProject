package com.brEnt.brFamily.mail.model.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.mail.model.vo.InfoMail;
import com.brEnt.brFamily.mail.model.vo.MailFile;
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

	public ArrayList<ReceiveMail> receiverList(String email, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("mailMapper.receiverList", email);
	}

	public ArrayList<SendMail> TempboxListView(String email, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("mailMapper.tempboxListView", email);
	}

	public ArrayList<SendMail> recycleBinList(String email, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("mailMapper.recycleBinList", email);
	}

	public ArrayList<ReceiveMail> recycleBinRList(String email, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.recycleBinRList", email);
	}

	public int insertSMail(SendMail s, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("mailMapper.insertSMail", s);
	}

	public int insertRMail(ArrayList<ReceiveMail> rlist, SqlSessionTemplate sqlSession) {		
		return sqlSession.insert("mailMapper.insertRMail", rlist);
	}
	
	public int insertMFMail(MailFile mf, SqlSessionTemplate sqlSession) {
			return sqlSession.insert("mailMapper.insertMFMail", mf);
		}

	public int tempSMail(SendMail s, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("mailMapper.tempSMail", s);
	}

	public int tempRMail(ArrayList<ReceiveMail> rlist, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("mailMapper.tempRMail", rlist);
	}

	public int tempMFMail(MailFile mf, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("mailMapper.tempMFMail", mf);
	}

	public int deleteMail(Map<String, Object> map, SqlSessionTemplate sqlSession) {
			System.out.println(((String[])map.get("mailNo"))[0]);
			//System.out.println(((String[])map.get("mailNo"))[1]);

		System.out.println(map.get("email"));
		return sqlSession.update("mailMapper.deleteMail", map);	
	}

	public int readMail(ReceiveMail rmail, SqlSessionTemplate sqlSession) {
		return sqlSession.update("mailMapper.readMail", rmail);
	}
	
	public ReceiveMail detailRMail(ReceiveMail rmail, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.detailRMail", rmail);
	}

	public ArrayList<MailFile> detailMFMail(ReceiveMail rmail, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.detailMFMail", rmail);
	}

	public int updateImpor(ReceiveMail r, SqlSessionTemplate sqlSession) {
		return sqlSession.update("mailMapper.updateImpor", r);
	}

	public ArrayList<ReceiveMail> imporListView(ReceiveMail r, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.imporListView", r);
	}

	public ReceiveMail reply(ReceiveMail r, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.reply", r);
	}

	public ArrayList<MailFile> replyMF(ReceiveMail r, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.replyMF", r);
	}

	public ReceiveMail forwardMail(ReceiveMail r, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.forwardMail", r);
	}

	public ArrayList<MailFile> forwarMFMail(ReceiveMail r, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.forwarMFMail", r);
	}

	public SendMail detailSMail(SendMail smail, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.detailSMail", smail );
	}

	public ArrayList<MailFile> detailMFMail(SendMail smail, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.detailMFMail", smail);
	}

	public SendMail forwardSMail(SendMail s, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.forwardSMail", s);
	}

	public ArrayList<MailFile> forwardMFSMail(SendMail s, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mailMapper.forwardMFSMail", s);
	}

	public int deleteTMail(Map<String, Object> map, SqlSessionTemplate sqlSession) {
		return sqlSession.update("mailMapper.deleteTMail", map);
	}

	public int ttDeleteMail(Map<String, Object> map, SqlSessionTemplate sqlSession) {
		return sqlSession.update("mailMapper.ttDeleteMail", map);
	}
	
}
