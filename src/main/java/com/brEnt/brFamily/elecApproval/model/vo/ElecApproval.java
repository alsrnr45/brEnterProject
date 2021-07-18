package com.brEnt.brFamily.elecApproval.model.vo;

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
	private String ecDocName;
	private String ecWriter;
	private String ecTitle;
	private String ecCnt;
	private String ecCode;
	private String ecEnrolldate;
	private String ecUpdatedate;
	private String ecCompdate;
	private String ecCanceldate;
	private String ecStatus; 
	private String ecFileOrigin;
	private String ecFileUpdate; 
	
	private String offStart;
	private String offEnd;
	private String offReason;
	
	private int approvalPathNo;
	private int memeNo;
	private int ecTurn;
	private String apEnrolldate;
	
	private String deptName;
	private String posiName;
	
	private String exStatus;
	private String month;
	private String account;
	
}