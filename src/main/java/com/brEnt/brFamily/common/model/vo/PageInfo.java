package com.brEnt.brFamily.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PageInfo {
	
	private int listCount;
	private int currentPage;
	private int pageLimit;
	private int productLimit;
	
	private int startPage;
	private int endPage;
	private int maxPage;
}
