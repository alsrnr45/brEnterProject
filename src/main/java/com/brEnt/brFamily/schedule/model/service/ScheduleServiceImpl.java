package com.brEnt.brFamily.schedule.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.schedule.model.dao.ScheduleDao;
import com.brEnt.brFamily.schedule.model.vo.Schedule;
import com.brEnt.brFamily.schedule.model.vo.ScheduleFile;

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

	@Override
	public int planSch(Schedule s) {
		return sDao.planSch(sqlSession, s);
	}

	@Override
	public int planSchF(ScheduleFile sf) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public Schedule reqUpdateSch(int schNo) {
		
		return sDao.reqUpdateSch(sqlSession, schNo);
	}
	
	@Override
	public int updateSch(Schedule s) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSchF(ScheduleFile sf) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSch(Schedule s) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSchF(ScheduleFile sf) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	

}
