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
public class BoardMenuReply {
	
	private int weekmenuReplyNo;
	private int weekmenuNo;
	private int memNo;
	private String weekmenuReplyCnt;
	private Date weekmenuReplyEnroll;
	private Date weekmenuReplyUpdate;

}
