package com.campfire.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.campfire.domain.freeBoard.FreeBoardAttachVO;
import com.campfire.mapper.FreeBoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class FileCheckTask {
	
	@Setter(onMethod_ = @Autowired)
	private FreeBoardAttachMapper attachMapper;
	
	//아무 요일 매월 마지막날 03:00시에 실행
	//@Scheduled(cron="0 00 03 L * ?")
	
	//매일 23시 59분 59초에 실행
	@Scheduled(cron="59 59 23 * * ?")
	public void checkFiles() throws Exception {
		log.warn("-------------------------------");
		log.warn("file Check tast run............");
		log.warn("-------------------------------");
		
		List<FreeBoardAttachVO> fileList = attachMapper.getOldFiles();
		
		List<Path> fileListPaths = fileList.stream().map(vo -> 
			Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName()))
				.collect(Collectors.toList());
		
		fileList.stream().filter(vo -> vo.isFileType()).map(vo ->
			Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName()))
		.forEach(p -> fileListPaths.add(p));
		
		fileListPaths.forEach(log::warn);
		
		File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();
		
		File[] removeFiles = targetDir.listFiles(file -> !fileListPaths.contains(file.toPath()));
		
		for (File file : removeFiles) {
			log.warn(file.getPath() + " deleted");
			file.delete();
		}
	}
	
	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		
		return sdf.format(cal.getTime()).replace("-", File.separator);
	}
}
