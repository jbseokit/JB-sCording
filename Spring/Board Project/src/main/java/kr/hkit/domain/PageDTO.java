package kr.hkit.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
	private Criteria cri;
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		endPage = (int)(Math.ceil(cri.getPageNum()/10.0)) * 10;
		startPage = endPage - 9;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
