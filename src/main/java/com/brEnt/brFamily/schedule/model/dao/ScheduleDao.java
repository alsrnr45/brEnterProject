package com.brEnt.brFamily.schedule.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {

	public ArrayList<Schedule> selectList(SqlSessionTemplate sqlSession, Map<String, Integer> map) {

		return (ArrayList)sqlSession.selectList("scheduleMapper.selectList", map);
	}

}
