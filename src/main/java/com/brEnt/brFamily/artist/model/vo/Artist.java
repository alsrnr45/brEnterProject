package com.brEnt.brFamily.artist.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Artist {
	
	private int artistNo;
	private String name;
	private String info;
	private String img;
	private String album;
	private String award;
	private String musicBroad;
	private String broadCasting;
	private String status;

}
