package com.brEnt.brFamily.notice.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.notice.model.vo.Notice;

public interface NoticeService {

	// 공지사항 리스트 조회
	ArrayList<Notice> selectNoticeList();
	
	// 공지사항 조회수 증가
	int increaseCount(int nno);
	
	// 공지사항 상세 조회
	Notice selectNotice(int nno);
	
}
