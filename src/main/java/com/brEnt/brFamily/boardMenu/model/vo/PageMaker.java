package com.brEnt.brFamily.boardMenu.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class PageMaker {

	private int page = 1;
	private String keyword;
	private int total;
	private int rows;
	private int rowe;
	
	public void calc() {
		rows = page * 15 - 14;
		rowe = page * 15;
	}
}
