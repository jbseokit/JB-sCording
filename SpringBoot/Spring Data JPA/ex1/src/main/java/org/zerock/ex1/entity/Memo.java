package org.zerock.ex1.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

// JPA를 통해서 관리하게 되는 엔티티 객체를 위한 엔티티 클래스
// DB의 테이블과 같은 구조로 작성
@Entity
@Table(name= "tbl_memo")
@ToString
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Memo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	// mariaDB 경우 IDENTITY 전략 선택 시 auto_increment 방식 이용
	private Long mno;
	
	@Column(length = 200, nullable = false)
	private String memoText;
	
	
}
