package com.brEnt.brFamily.common.template;

import com.brEnt.brFamily.common.model.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int productLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount / productLimit);

		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		int endPage;
		if((endPage = startPage + pageLimit - 1) > maxPage) {
			endPage = maxPage;
		}
		
		return new PageInfo(listCount, currentPage, pageLimit, productLimit, startPage, endPage, maxPage);
		
	}

}
