package com.campfire.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.campfire.domain.AllFileDTO;
import com.campfire.domain.freeBoard.FreeBoardAttachVO;
import com.campfire.domain.guideBoard.GuideBoardAttachVO;
import com.campfire.domain.marketBoard.MarketBoardAttachVO;
import com.campfire.domain.marketBoard.MarketBoardVO;
import com.campfire.domain.reviewBoard.ReviewBoardAttachVO;
import com.campfire.domain.tipBoard.TipBoardAttachVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	
	String fileFolder = "/usr/local/upload/";
//	String uploadFolder = "/usr/local/upload";
	
	//썸네일 화면에 출력
	@ResponseBody
	@GetMapping("/display")
	public ResponseEntity<byte[]> display(String fileName) {
//		File file = new File("C:\\upload\\"+fileName);
		File file = new File("/usr/local/upload/"+fileName);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping(value="/upload/{vo}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<AllFileDTO> upload(MultipartFile uploadFile, @PathVariable("vo") String voName){
//		int check = 0;
		List<FreeBoardAttachVO> f_succeedList = new ArrayList<>();
		List<FreeBoardAttachVO> f_failureList = new ArrayList<>();
		List<ReviewBoardAttachVO> r_succeedList = new ArrayList<>();
		List<ReviewBoardAttachVO> r_failureList = new ArrayList<>();
		List<MarketBoardAttachVO> m_succeedList = new ArrayList<>();
		List<MarketBoardAttachVO> m_failureList = new ArrayList<>();
		List<GuideBoardAttachVO> g_succeedList = new ArrayList<>();
		List<GuideBoardAttachVO> g_failureList = new ArrayList<>();
		List<TipBoardAttachVO> t_succeedList = new ArrayList<>();
		List<TipBoardAttachVO> t_failureList = new ArrayList<>();
		
	
	
		if(voName.equals("free")) {check = 1;}
		else if(voName.equals("review")) {check = 2;}
		else if(voName.equals("market")) {check = 3;}
//		String uploadFolder = "C:\\upload";
		String uploadFolder = "/usr/local/upload";
		switch(check) {
		case 1:
			uploadFolder += "/free";
			break;
		case 2:
			uploadFolder += "/review";
			break;
		case 3:
			uploadFolder += "/market";
			break;
		}

		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		AllFileDTO allFile = new AllFileDTO();
		
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		FreeBoardAttachVO f_vo = new FreeBoardAttachVO();
		ReviewBoardAttachVO r_vo = new ReviewBoardAttachVO();
		MarketBoardAttachVO m_vo = new MarketBoardAttachVO();
		GuideBoardAttachVO g_vo = new GuideBoardAttachVO();
		TipBoardAttachVO t_vo = new TipBoardAttachVO();
		
		
		String uploadFileName = uploadFile.getOriginalFilename();
		String temp = uploadFileName;
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		InputStream in = null;
		
		try {
			File saveFile = new File(uploadPath, uploadFileName);
			uploadFile.transferTo(saveFile);
			in = new FileInputStream(saveFile);
			
			switch(voName) {
			case "free":
				f_vo.setFileName(temp);
				f_vo.setUuid(uuid.toString());
				f_vo.setUploadPath(uploadFolderPath);
				f_vo.setFileType(true);
				f_succeedList.add(f_vo);
				break;
			case "review":
				log.info("uploadController!~~~~~~~~~~!: " + uploadFolderPath);
				r_vo.setFileName(temp);
				r_vo.setUuid(uuid.toString());
				r_vo.setUploadPath(uploadFolderPath);
				log.info("왜 안 돼????????"+r_vo.getUploadPath());
				r_vo.setFileType(true);
				r_succeedList.add(r_vo);
				break;
			case "market":
				m_vo.setFileName(temp);
				m_vo.setUuid(uuid.toString());
				m_vo.setUploadPath(uploadFolderPath);
				m_vo.setFileType(true);
				m_succeedList.add(m_vo);
				break;
			case "guide":
				g_vo.setFileName(temp);
				g_vo.setUuid(uuid.toString());
				g_vo.setUploadPath(uploadFolderPath);
				g_vo.setFileType(true);
				g_succeedList.add(g_vo);
				break;
			case "tip":
				t_vo.setFileName(temp);
				t_vo.setUuid(uuid.toString());
				t_vo.setUploadPath(uploadFolderPath);
				t_vo.setFileType(true);
				t_succeedList.add(t_vo);
				break;
			}
			
		} catch (Exception e) {
			if(voName.equals("free")) {f_failureList.add(f_vo);}
			else if(voName.equals("review")) {r_failureList.add(r_vo);}
			else if(voName.equals("market")) {m_failureList.add(m_vo);}
			else if(voName.equals("guide")) {g_failureList.add(g_vo);}
			else if(voName.equals("tip")) {t_failureList.add(t_vo);}
			log.error(e.getMessage());
		}
		
		switch(voName) {
		case "free":
			allFile.setF_succeedList(f_succeedList);
			allFile.setF_failureList(f_failureList);
			break;
		case "review":
			allFile.setR_succeedList(r_succeedList);
			allFile.setR_failureList(r_failureList);
			break;
		case "market":
			allFile.setM_succeedList(m_succeedList);
			allFile.setM_failureList(m_failureList);
			break;
		case "guide":
			allFile.setG_succeedList(g_succeedList);
			allFile.setG_failureList(g_failureList);
			break;
		case "tip":
			allFile.setT_succeedList(t_succeedList);
			allFile.setT_failureList(t_failureList);
			break;
		}
		return new ResponseEntity<AllFileDTO>(allFile, HttpStatus.OK);
	}
	
	//첨부파일 삭제
	@ResponseBody
	@PostMapping(value="/deleteFile", produces="text/html; charset=utf-8")
	public ResponseEntity<String> deleteFile(String fileName, String fileType){
		File file = null;
		
		try {
//			file = new File("C:\\upload\\" + URLDecoder.decode(fileName));
			file = new File("/usr/local/upload/" + URLDecoder.decode(fileName));
			file.delete();
			
			if(fileType.equals("image")) {
				String original = file.getPath().replace("s_", "");
				file = new File(original);
				
				System.gc();
				System.runFinalization();
				
				file.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("첨부파일을 삭제하였습니다.", HttpStatus.OK);
	}
	
	//첨부파일 다운로드
	@ResponseBody
	@GetMapping(value="/download", produces= {MediaType.APPLICATION_OCTET_STREAM_VALUE})
	public ResponseEntity<Resource> download(String fileName, @RequestHeader("User-Agent") String userAgent){
		//Resource resource = new FileSystemResource("C:\\upload\\" + fileName);
		Resource resource = new FileSystemResource("/usr/local/upload/" + fileName);
		
		String resourceName = resource.getFilename();
		String originalName = resourceName.substring(resourceName.indexOf("_") + 1);
		HttpHeaders headers = new HttpHeaders();
		
		try {
			String downloadName = null;
			if(userAgent.contains("Trident")) {
				downloadName = URLEncoder.encode(originalName, "UTF-8");
			}else if(userAgent.contains("Edg")) {
				downloadName = URLEncoder.encode(originalName, "UTF-8");
			}else {
				downloadName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			headers.add("Content-Disposition", "attachment; filename="+downloadName); 
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(resource, headers, HttpStatus.OK);
	}
	
	
	//년,월,일로 경로 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return sdf.format(date).replace("-", File.separator);
	}

}