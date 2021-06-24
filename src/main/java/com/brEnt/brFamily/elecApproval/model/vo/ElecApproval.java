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
	private String ecWriter;
	private String ecTitle;
	private String ecCnt;
	private String ecCode;
	private String ecEnrollDate;
	private String ecUpdateDate;
	private String ecCompDate;
	private String ecStatus; 
	
}
