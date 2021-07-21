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

	// 공지사항 조회수 증가
	@Override
	public int increaseCount(int nno) {
		return nDao.increaseCount(sqlSession, nno);
	}
	
	// 공지사항 상세 조회
	@Override
	public Notice selectNotice(int nno) {
		return nDao.selectNotice(sqlSession, nno);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(sqlSession, n);
	}
	
}
