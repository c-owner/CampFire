package com.campfire.domain.marketBoard;

import lombok.Data;

@Data
public class MarketBoardAttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private Long bno;
}
