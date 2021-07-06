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
public class BoardFreeReply {
	
	private int freeReplyNo;
	private int freeNo;
	private String memNo;
	private int freeReplyCount; 
	private String freeReplyCnt;
	private String freeReplyEnroll;
	private String freeReplyUpdate;
	private int freeReplyLike; 			
	private String freeReplyStatus; 
		
}
