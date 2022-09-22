package kr.hkit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	private long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
}
