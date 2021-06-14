package com.campfire.domain.foodBoard;

import lombok.Data;

@Data
public class FoodBoardAttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private Long bno;
}
