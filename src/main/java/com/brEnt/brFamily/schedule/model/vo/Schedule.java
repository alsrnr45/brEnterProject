package com.brEnt.brFamily.schedule.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Schedule {
	private int schNo;
	private int memNo;
	private String deptNo;
	private String schTitle;
	private String schContent;
	private String startDate;
	private String endDate;
	private int attendance;
	private String schCategory;
	private String schStatus;
}
