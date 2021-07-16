package com.brEnt.brFamily.elecApproval.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Approval_path {

	private int approvalPathNo;
	private int ecDocNo;
	private int memNo;
	private int ecTurn;
	private String ecStatus;
	private String apEnrolldate;

	private String deptName;
	private String posiName;
	private String memName;
	//private int mno;
	
	private ArrayList<Approval_path> ApprovalPathList;
}
