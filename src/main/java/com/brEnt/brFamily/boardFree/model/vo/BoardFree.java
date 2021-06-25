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
	private String memNo;
	private String freeTitle;
	private String freeCnt;
	private String freeEnrolldate;
	private String freeUpdatedate;
	private int freeCount;
	private String freeStatus; 
	private String freeFileOrigin;
	private String freeFileUpdate; 
	
}
