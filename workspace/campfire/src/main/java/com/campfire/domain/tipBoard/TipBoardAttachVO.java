package com.campfire.domain.tipBoard;

import lombok.Data;

@Data
public class TipBoardAttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private Long bno;
}
