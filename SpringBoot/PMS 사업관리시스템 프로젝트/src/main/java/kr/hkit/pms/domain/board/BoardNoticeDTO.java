package kr.hkit.pms.domain.board;

import java.sql.Date;
import java.time.LocalDate;

import lombok.Data;

@Data
public class BoardNoticeDTO {
	private Long IDX; // 인덱스
	private String POST_TITLE; // 제목
	private String POST_CONTENT; // 내용
	private String POST_WRITER; //작성자
	private Date POST_REGISTER_TIME; // 시간
}
