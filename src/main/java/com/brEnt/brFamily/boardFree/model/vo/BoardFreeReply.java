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
	private int memNo;
	private int freeReplyCount; 
	private String freeReplyCnt;
	private String freeReplyEnroll;
	private String freeReplyUpdate;
	private int freeReplyLike; 			// 자유 댓글 좋아요 수 
	private String freeReplyStatus; 
		
}
