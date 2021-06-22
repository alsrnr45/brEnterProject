package com.brEnt.brFamily.store.model.vo;

src/main/java/com/brEnt/brFamily/store/model/vo/Store.java
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

public class Store {

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Product {
	
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
