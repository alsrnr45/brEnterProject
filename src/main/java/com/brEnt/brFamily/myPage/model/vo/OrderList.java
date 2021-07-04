package com.brEnt.brFamily.myPage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 작성자 : 박지은 - 주문내역 조회
@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString

public class OrderList {

	private int order_no; 
	private int pdt_no; 
	private int pdt_count; 
	private int mem_no; 
	private String order_receiver; 
	private String post_code;
	private String road_address;
	private String detail_address;
	private String receiver_phone;
	private String ship_message;
	private int total_price;
	private String pay_method;
	
}
