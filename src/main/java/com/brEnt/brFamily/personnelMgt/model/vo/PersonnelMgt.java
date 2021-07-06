package com.brEnt.brFamily.personnelMgt.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PersonnelMgt {
	
	private int attendNo;
	private int memNo;
	private Date today;
	private String checkIn;
	private String checkOut;
	private int totalTime;

}
