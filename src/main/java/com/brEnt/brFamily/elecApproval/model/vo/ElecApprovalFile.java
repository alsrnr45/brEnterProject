package com.brEnt.brFamily.elecApproval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ElecApprovalFile {
	
	private int ecFileNo;
	private int ecDocumentNo;
	private String ecFileOrigin;
	private String ecFileUpdate;
	private String ecFilePath;
	private String ecFileUpload;
	private String ecFileSize; 
	
}
