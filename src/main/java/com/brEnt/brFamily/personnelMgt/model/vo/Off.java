package com.brEnt.brFamily.personnelMgt.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Off {

	private int ecDocNo;
	private String offStart;
	private String offEnd;
	
	private int memNo;
	private String ecDocName;
	private String ecEnrolldate;
	private String ecStatus; 

}
