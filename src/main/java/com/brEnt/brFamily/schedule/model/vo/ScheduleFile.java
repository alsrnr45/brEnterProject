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
public class ScheduleFile {
	private int schFileNo;
	private int schNo;
	private String schOriginName;
	private String schUpdateName;
	private String schFilePath;
	private String schFilesize;
	private String schFiletype;
	
}
