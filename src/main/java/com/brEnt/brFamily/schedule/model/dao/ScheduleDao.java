package com.brEnt.brFamily.schedule.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.schedule.model.vo.Schedule;
import com.brEnt.brFamily.schedule.model.vo.ScheduleFile;

@Repository
public class ScheduleDao {

	public ArrayList<Schedule> selectList(SqlSessionTemplate sqlSession, Map<String, Integer> map) {

		return (ArrayList)sqlSession.selectList("scheduleMapper.selectList", map);
	}
	
	public int planSch(SqlSessionTemplate sqlSession, Schedule s) {
		
		return sqlSession.update("scheduleMapper.planSch", s);
		
	}

	public Schedule reqUpdateSch(SqlSessionTemplate sqlSession, int schNo) {
		
		return (Schedule) sqlSession.selectList("scheduleMapper.reqUpdateSch", schNo);
	}

}
