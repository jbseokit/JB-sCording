package com.yh2.db.service;

import java.util.Date;
import java.util.HashMap;

import javax.annotation.PostConstruct;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

import com.yh2.db.async.AsyncTransferToFile;
import com.yh2.db.mapper.DbMapper;
import com.yh2.db.model.FraudModel;
import com.yh2.db.model.ResultModel;

import lombok.extern.log4j.Log4j2;


@Service
@Log4j2
public class FraudService {
	
	// mapper 객체 생성
	@Autowired
	DbMapper dbmapper;
	
	// 결과값 받아올 객체
	String resultcode;
	String fishing;
	
	// Web Client 사용 준비
	private WebClient webClient;
	private String filepath;
	
	@Autowired
	AsyncTransferToFile asynctransfertofile;
	
	@PostConstruct
	public void initWebClient() {
		webClient = WebClient.create("http://127.0.0.1:5050");
	}
	
	//@Async
	public String uploadAll(@RequestParam(value = "fileowner") String fileowner, 
							@RequestParam(value = "filename") String filename, 
						    @RequestParam(value = "filetype") String filetype, 
						    @RequestParam(value = "filetime") @DateTimeFormat(pattern = "yyyy-MM-dd") Date filetime, 
						    @RequestParam(value = "audiofile") MultipartFile audiofile)  throws Exception {
			
		// DB 삽입
		FraudModel fraudmodel = new FraudModel();
		fraudmodel.setFileowner(fileowner);
		fraudmodel.setFilename(filename);
		fraudmodel.setFiletype(filetype);
		fraudmodel.setFiletime(filetime);
		dbmapper.insertFileinfo(fraudmodel);
		
		// 클라이언트로 부터 받아온 파일 저장		
		asynctransfertofile.transferTo(audiofile);
		//audiofile.transferTo(new File(audiofile.getOriginalFilename()));
		
		// 파일 경로를 딥러닝 서버에 전송
		filepath = "C:/YhdbData/Audio/" + audiofile.getOriginalFilename();
		MultiValueMap<String, String> formData = new LinkedMultiValueMap<>();
		formData.add("filepath", filepath);
		
		resultcode = webClient.post()
						.uri("/stt")
						.contentType(MediaType.APPLICATION_FORM_URLENCODED)
						.body(BodyInserters.fromFormData(formData))
						.retrieve()
						.bodyToMono(String.class)
						.block();
		
				
		// 결과 값을 DB에 삽입		
		ResultModel resultmodel = new ResultModel();
		resultmodel.setResultCode(resultcode);
		dbmapper.insertPredict(resultmodel);
		
		// json 포맷 데이터 중 fraudcode만 추출해서 return
		JSONParser jsonParse = new JSONParser();
		JSONObject jsonObject = (JSONObject)jsonParse.parse(resultcode);
		
		
		// Json 포맷으로 literal 타입의 resultcode를 클라이언트에게 Response
		return  jsonObject.get("fishing").toString();
		
	}
	
}
