package com.campfire.domain.reviewBoard;

import lombok.Data;

@Data
public class ReviewBoardAttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private Long bno;

}
