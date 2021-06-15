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
import com.campfire.domain.marketBoard.MarketBoardAttachVO;
import com.campfire.mapper.FreeBoardAttachMapper;
import com.campfire.mapper.MarketBoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class FileCheckTask {
	
	@Setter(onMethod_ = @Autowired)
	private FreeBoardAttachMapper f_attachMapper;
	
	@Setter(onMethod_ = @Autowired)
	private MarketBoardAttachMapper m_attachMapper;
	
	//아무 요일 매월 마지막날 03:00시에 실행
	//@Scheduled(cron="0 00 03 L * ?")
	
	//매초마다 실행
	//@Scheduled(cron="* * * * * *")
	
	//매일 23시 59분 59초에 실행
	@Scheduled(cron="59 59 23 * * ?")
	public void checkFiles() throws Exception {
		log.warn("-------------------------------");
		log.warn("file Check tast run............");
		log.warn("-------------------------------");
		
		//자유게시판
		List<FreeBoardAttachVO> f_fileList = f_attachMapper.getOldFiles();
		List<Path> f_fileListPaths = f_fileList.stream().map(f_vo -> 
			Paths.get("C:\\upload", f_vo.getUploadPath(), f_vo.getUuid() + "_" + f_vo.getFileName()))
				.collect(Collectors.toList());
		
		f_fileListPaths.forEach(log::warn);
		
		File f_targetDir = Paths.get("C:\\upload\\free\\", getFolderYesterDay()).toFile();
		
		File[] f_removeFiles = f_targetDir.listFiles(file -> !f_fileListPaths.contains(file.toPath()));
		
		for (File f_file : f_removeFiles) {
			log.warn(f_file.getPath() + " deleted");
			f_file.delete();
		}
		
		//장터게시판
		List<MarketBoardAttachVO> m_fileList = m_attachMapper.getOldFiles();
		List<Path> m_fileListPaths = m_fileList.stream().map(m_vo -> 
			Paths.get("C:\\upload", m_vo.getUploadPath(), m_vo.getUuid() + "_" + m_vo.getFileName()))
				.collect(Collectors.toList());
		
		m_fileListPaths.forEach(log::warn);
		
		File m_targetDir = Paths.get("C:\\upload\\market\\", getFolderYesterDay()).toFile();
		
		File[] m_removeFiles = m_targetDir.listFiles(file -> !m_fileListPaths.contains(file.toPath()));
		
		for (File m_file : m_removeFiles) {
			log.warn(m_file.getPath() + " deleted");
			m_file.delete();
		}
	}
	
	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		
		return sdf.format(cal.getTime()).replace("-", File.separator);
	}
}
