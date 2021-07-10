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
public class PayDto {
	
	private int orderNo;
	private int pdtNo;
	private int memNo;
	private String orderReceiver;
	private String postCode;
	private String roadAddress;
	private String detailAddress;
	private String receiverPhone;
	private String shipMessage;
	private int totalPrice;
	private String payMethod;
	private String orderDate;
	private int pdtCount;	

}
