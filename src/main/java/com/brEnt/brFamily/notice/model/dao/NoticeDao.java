package com.brEnt.brFamily.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	// 공지사항 리스트 조회
	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList");
	}
}
