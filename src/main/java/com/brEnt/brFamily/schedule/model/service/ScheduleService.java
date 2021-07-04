package com.brEnt.brFamily.schedule.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.brEnt.brFamily.schedule.model.vo.Schedule;
import com.brEnt.brFamily.schedule.model.vo.ScheduleFile;

public interface ScheduleService {

	// 1. 일정 현황 조회
	ArrayList<Schedule> selectList(Map<String, Integer> map);
	
	// 2-1. 일정 추가
	int planSch(Schedule s);
	
	// 2-2. 일정 첨부파일 추가
	int planSchF(ScheduleFile sf);
	
	// 3-3. 일정수정페이지 이동
	Schedule reqUpdateSch(int schNo);
	
	// 3-2. 일정 수정
	int updateSch(Schedule s);
	
	// 3-3. 일정 첨부파일 수정
	int updateSchF(ScheduleFile sf);
	
	// 4-1. 일정 삭제
	int deleteSch(Schedule s);
	
	// 4-2. 일정 첨부파일 삭제
	int deleteSchF(ScheduleFile sf);

	
}
