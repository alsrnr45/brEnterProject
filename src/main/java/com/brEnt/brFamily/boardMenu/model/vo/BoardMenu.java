package com.brEnt.brFamily.boardMenu.model.vo;

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
public class BoardMenu {
	
	private int weekmenuNo; // 주간식단글번호
	private int memNo; // 사원번호
	private String weekmenuTitle; // 주간식단글제목
	private String weekmenuCnt; // 주간식단글내용
	private Date weekmenuEnrolldate; // 주간식단작성일
	private int weekmenuCount; // 주간식단조회수
	private Date weekmenuUpdatedate; // 주간식단수정일
	
	

}
