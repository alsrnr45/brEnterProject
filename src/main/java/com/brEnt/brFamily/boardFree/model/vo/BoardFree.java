package com.brEnt.brFamily.boardFree.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BoardFree {
	
	private int freeNo;
	private int memNo;
	private String freeTitle;
	private String freeCnt;
	private String freeEnrollDate;
	private String freeUpdateDate;
	private int freeCount;
	private String freeStatus; 
	private String freeFileOrigin;
	private String freeFileUpdate; 
	
}
