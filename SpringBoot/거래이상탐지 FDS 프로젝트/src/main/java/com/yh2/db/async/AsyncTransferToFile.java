package com.yh2.db.async;

import java.io.File;
import java.io.IOException;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.multipart.MultipartFile;

@Configuration
public class AsyncTransferToFile {
	
	@Async
	public void transferTo(MultipartFile audiofile) {
		try {
			audiofile.transferTo(new File(audiofile.getOriginalFilename()));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
