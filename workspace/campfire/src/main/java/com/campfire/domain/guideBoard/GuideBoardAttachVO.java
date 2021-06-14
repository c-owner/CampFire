package com.campfire.domain.guideBoard;

import lombok.Data;

@Data
public class GuideBoardAttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private Long bno;
}
