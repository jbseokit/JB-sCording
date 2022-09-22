package kr.hkit.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {
	private int pageNum;
	private int amount; //한페이지당 몇개
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
