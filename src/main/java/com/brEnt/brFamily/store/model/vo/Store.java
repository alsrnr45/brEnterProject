package com.brEnt.brFamily.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Store {

	private int pdtNo;
	private String pdtCtg;
	private String pdtFile;
	private String pdtName;
	private String pdtDetail;
	private int orgPrice;
	private int memPrice;
	private int pdtStock;
	private String pdtEnrolldate;
	private String pdtStatus;
	
}
