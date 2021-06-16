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
import com.campfire.domain.guideBoard.GuideBoardAttachVO;
import com.campfire.domain.marketBoard.MarketBoardAttachVO;
import com.campfire.domain.tipBoard.TipBoardAttachVO;
import com.campfire.mapper.FreeBoardAttachMapper;
import com.campfire.mapper.GuideBoardAttachMapper;
import com.campfire.mapper.MarketBoardAttachMapper;
import com.campfire.mapper.TipBoardAttachMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Component
@Log4j
@AllArgsConstructor
public class FileCheckTask {
	
	private FreeBoardAttachMapper f_attachMapper;
	private TipBoardAttachMapper t_attachMapper;
	private GuideBoardAttachMapper g_attachMapper;
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
			//Paths.get("C:\\upload", f_vo.getUploadPath(), f_vo.getUuid() + "_" + f_vo.getFileName()))
			Paths.get("/usr/local/upload/", f_vo.getUploadPath(), f_vo.getUuid() + "_" + f_vo.getFileName()))
				.collect(Collectors.toList());
		
		f_fileListPaths.forEach(log::warn);
		
		//File f_targetDir = Paths.get("C:\\upload\\free\\", getFolderYesterDay()).toFile();
		File f_targetDir = Paths.get("/usr/local/upload/free/", getFolderYesterDay()).toFile();
		
		File[] f_removeFiles = f_targetDir.listFiles(file -> !f_fileListPaths.contains(file.toPath()));
		
		for (File f_file : f_removeFiles) {
			log.warn(f_file.getPath() + " deleted");
			f_file.delete();
		}
		
		// 캠핑 팁
		List<TipBoardAttachVO> t_fileList = t_attachMapper.getOldFiles();
		List<Path> t_fileListPaths = t_fileList.stream().map(t_vo -> 
			//Paths.get("C:\\upload", t_vo.getUploadPath(), t_vo.getUuid() + "_" + t_vo.getFileName()))
			Paths.get("/usr/local/upload/", t_vo.getUploadPath(), t_vo.getUuid() + "_" + t_vo.getFileName()))
				.collect(Collectors.toList());
		
		t_fileListPaths.forEach(log::warn);
		
		//File t_targetDir = Paths.get("C:\\upload\\free\\", getFolderYesterDay()).toFile();
		File t_targetDir = Paths.get("/usr/local/upload/free/", getFolderYesterDay()).toFile();
		
		File[] t_removeFiles = t_targetDir.listFiles(file -> !t_fileListPaths.contains(file.toPath()));
		
		for (File t_file : t_removeFiles) {
			log.warn(t_file.getPath() + " deleted");
			t_file.delete();
		}
		
		// 캠핑 가이드
		List<GuideBoardAttachVO> g_fileList = g_attachMapper.getOldFiles();
		List<Path> g_fileListPaths = g_fileList.stream().map(g_vo -> 
			//Paths.get("C:\\upload", g_vo.getUploadPath(), g_vo.getUuid() + "_" + g_vo.getFileName()))
			Paths.get("/usr/local/upload/", g_vo.getUploadPath(), g_vo.getUuid() + "_" + g_vo.getFileName()))
				.collect(Collectors.toList());
		
		g_fileListPaths.forEach(log::warn);
		
		//File g_targetDir = Paths.get("C:\\upload\\free\\", getFolderYesterDay()).toFile();
		File g_targetDir = Paths.get("/usr/local/upload/free/", getFolderYesterDay()).toFile();
		
		File[] g_removeFiles = g_targetDir.listFiles(file -> !g_fileListPaths.contains(file.toPath()));
		
		for (File g_file : g_removeFiles) {
			log.warn(g_file.getPath() + " deleted");
			g_file.delete();
		}
		
		//장터게시판
		List<MarketBoardAttachVO> m_fileList = m_attachMapper.getOldFiles();
		List<Path> m_fileListPaths = m_fileList.stream().map(m_vo -> 
			//Paths.get("C:\\upload", m_vo.getUploadPath(), m_vo.getUuid() + "_" + m_vo.getFileName()))
			Paths.get("/usr/local/upload/", m_vo.getUploadPath(), m_vo.getUuid() + "_" + m_vo.getFileName()))
				.collect(Collectors.toList());
		
		m_fileListPaths.forEach(log::warn);
		
		//File m_targetDir = Paths.get("C:\\upload\\market\\", getFolderYesterDay()).toFile();
		File m_targetDir = Paths.get("/usr/local/upload/market/", getFolderYesterDay()).toFile();
		
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
