package com.brEnt.brFamily.mail.model.dao;

import java.util.ArrayList;
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

	public int deleteMail(String[] mail_arr, String email, SqlSessionTemplate sqlSession) {
		int result = 0;
		
		for(int i=0; i<mail_arr.length; i++) {
			String mail_no = mail_arr[i];
			Map<String, String> map = new HashMap<String, String>();

			map.put("mail_no", mail_no);
			map.put("email", email);
			System.out.println("map 값" + map);
			result += sqlSession.update("mailMapper.deleteMail", map);	
			System.out.println("결과값:" + result);
		}
		
		return result;
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

	
}
