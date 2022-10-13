package com.ieetu.study.paging;

import lombok.Data;

@Data
public class PageNum {
	
    private Criteria cri;
	
    private int startPage;
	
    private int endPage;
	
    private boolean prev, next;
	
    private int total;
	
	public PageNum(Criteria cri, int total) {
		
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
