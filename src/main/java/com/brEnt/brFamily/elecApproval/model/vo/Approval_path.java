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
public class Approval_path {

	private int approvalPathNo;
	private int ecDocNo;
	private int memeNo;
	private int ecTurn;
	private String ecStatus;
	private String apEnrolldate;
}
