package kr.hkit.pms.domain.board;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class BoardDto {
	private int Idx;
	private String title;
	private String contents;
	private String image;
	private LocalDateTime registertime;
}
