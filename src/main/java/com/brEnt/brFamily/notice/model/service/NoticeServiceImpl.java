package com.brEnt.brFamily.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.notice.model.dao.NoticeDao;
import com.brEnt.brFamily.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao nDao;

	// 공지사항 리스트 조회
	@Override
	public ArrayList<Notice> selectNoticeList() {
		return nDao.selectNoticeList(sqlSession);
	}
	
}
