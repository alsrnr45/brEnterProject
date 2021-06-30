package com.brEnt.brFamily.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Position {

	private int posiNo;
	private String posiName;
	private int baseSalary;
	private int hourlyPay;

}
