package com.yh2.db.controller;

import java.util.Date;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yh2.db.service.FraudService;

import lombok.extern.log4j.Log4j2;


@RestController
@Log4j2
public class FraudController {
	
	// Service 호출 준비
	@Autowired
	FraudService fraudservice;
	
	// 파일 및 파일의 정보를 처리하는 API
	@PostMapping("/uploadAll")
	//@Async
	public ResponseEntity<Object> upload(@RequestParam(value = "fileowner") String fileowner, 
										 @RequestParam(value = "filename") String filename, 
										 @RequestParam(value = "filetype") String filetype, 
										 @RequestParam(value = "filetime") @DateTimeFormat(pattern = "yyyy-MM-dd") Date filetime, 
										 @RequestParam(value = "audiofile") MultipartFile audiofile) {
		try {
			return new ResponseEntity<>(fraudservice.uploadAll(fileowner, filename, filetype, filetime, audiofile), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>("내부 서버 오류", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	// 비동기 처리를 위한 테스트용 API
	@PostMapping("/async")
	@Async
	public void async() throws InterruptedException {
		for (int i=0 ; i<100 ; i++) {
			Thread.sleep(100);
			log.info(i);
		}
	}
	

}
// -1 값이 넘어오면 데이터가 충분하지 않다는 결과값을 클라이언트에게 보내는 기능 구현 예정