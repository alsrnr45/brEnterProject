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

	private int order_no; // 주문번호
	private int pdt_no; // 상품번호
	private int pdt_count; // 수량
	private int mem_no; // 사원번호
	private String order_receiver; // 수령자
	private String post_code; // 우편번호
	private String road_address; // 도로명주소
	private String detail_address; // 상세주소
	private String receiver_phone; // 연락처
	private String ship_message; // 배송메세지
	private int total_price; // 총가격
	private String pay_method; // 결제수단
	private String pdt_name; // 상품명
	private String pdt_file; // 상품사진
	private int mem_price; // 직원가
	
}
