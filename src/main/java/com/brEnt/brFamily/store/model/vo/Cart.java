package com.brEnt.brFamily.store.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Cart {

	private int cartNo;
	private int memNo;
	private int pdtNo;
	private int pdtCount;
	private Date insertDate;
	private String pdtCtg;  
	private String pdtFile;
	private String pdtName;
	private int orgPrice;
	private int memPrice;
	private int pdtStock;
	private Date pdtEnrolldate;
	private String pdtStatus;
	
}
