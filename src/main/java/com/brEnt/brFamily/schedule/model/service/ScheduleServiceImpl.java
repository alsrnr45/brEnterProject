package com.brEnt.brFamily.schedule.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.schedule.model.dao.ScheduleDao;
import com.brEnt.brFamily.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService  {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ScheduleDao sDao;
	
	@Override
	public ArrayList<Schedule> selectList(Map<String, Integer> map) {
		return sDao.selectList(sqlSession, map);
	}

}
