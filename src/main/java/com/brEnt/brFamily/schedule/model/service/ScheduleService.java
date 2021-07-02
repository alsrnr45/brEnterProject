package com.brEnt.brFamily.schedule.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.brEnt.brFamily.schedule.model.vo.Schedule;

public interface ScheduleService {

	// 1. 스케줄 현황 조회
	ArrayList<Schedule> selectList(Map<String, Integer> map);
	
	
}
