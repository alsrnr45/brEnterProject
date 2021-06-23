package com.brEnt.brFamily.elecApproval.model.vo;

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
public class ElecApproval {
	
	private int ecDocNo;
	private int memNo;
	private String ecWriter;
	private String ecTitle;
	private String ecCnt;
	private String ecCode;
	private Date ecEnrollDate;
	private Date ecUpdateDate;
	private Date ecCompDate;
	private String ecStatus; 
	
}
