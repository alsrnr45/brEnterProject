package com.brEnt.brFamily.personnelMgt.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SalaryDto {

	private int salaryListNo;
	private int memNo;
	private String workingYear;
	private String workingMonth;
	private int workingHour;
	private int overtimeHour;
	private int salary;
	private String salaryDay;
	private int posiNo;
	private String posiName;
	private int baseSalary;
	private int hourlyPay;
	private int attendNo;
	private int atCount;
	private int atSum;
	private int atAvg;
}
