package org.zerock.ex1.repository;

import java.util.List;
import java.util.Optional;
import java.util.stream.IntStream;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.test.annotation.Commit;
import org.zerock.ex1.entity.Memo;

@SpringBootTest
public class MemoRepositoryTests {
	
	@Autowired
	MemoRepository mr;
	
	// JpaRepository가 정상적으로 스프링에서 처리 및 의존성 주입에 문제가 없는지 확인
	// 동적 프록시 방식으로 repository가 해당 클래스를 생성
	// @Test
	public void testClass() {
		System.out.println("mr.getClass().getName()");
		System.out.println(mr.getClass().getName());
		
	}
	
	// insert 테스트(save()) : 한번에 여러 개의 엔티티 객체를 저장, Memo 엔티티 객체 생성후 Repository 이용하여 insert
	// @Test
	public void testInsertDummies() {
		
		IntStream.rangeClosed(1, 100).forEach(i -> {
			Memo memo = Memo.builder().memoText("Sample..." + i).build();
			mr.save(memo);
		});
	}
	
	// select 테스트( findById(), getOne() ) : 엔티티 객체 조회
	
	// findById : Optional 타입으로 반환, 한번 더 결과가 존재하지를 체크, 실행 순간 이미 SQL 처리 -> java 코드 실행
	// @Test
	public void testSelect() {
		
		// DB에 존재하는 mno
		Long mno = 100L;
		
		Optional<Memo> result = mr.findById(mno);
		
		System.out.println("==============================");
		
		if(result.isPresent()) {
			Memo memo = result.get();
			System.out.println(memo);
		}
		
	}
	
	// getOne : @Transactional 필요, 해당 객체 타입으로 리턴, 실제 객체가 필요한 순간까지 SQL 실행을 미뤄둠
	// @Transactional
	// @Test
	/*public void testSelect2() {
		
		// DB에 존재하는 mno
		Long mno = 100L;
				
		// getOne is deprecated
		Memo memo = mr.getOne(mno);
			
		System.out.println("==============================");
				
		System.out.println(memo);
	} */
	
	// update 테스트(save()) : 내부적으로 해당 엔티티의 @Id값이 일치하는지 확인 (select) -> insert 혹은 update 실행
	// JPA는 엔티티 객체들을 "메모리상에 보관" -> So, 특정 엔티티 객체가 존재하는지 확인하는 select 실행 이유가 된다
	//@Test
	public void testUpdate() {
		
		Memo memo = Memo.builder().mno(100L).memoText("Upate text").build();
		System.out.println(mr.save(memo));
		
	}
	
	// delete 테스트( deleteById(), delete() ) : 삭제하려는 번호의 엔티티 객체 확인(select) -> 삭제 실시
	// 리턴 타입이 void 이고 삭제하려는 데이터가 없는 경우 EmptyResultDataAccessException 예외 발생
	// @Test
	public void testDelete() {
		Long mno = 100L;
		mr.deleteById(mno);
	}
	
	// 페이징 및 정렬 (페이징 처리는 반드시 '0'부터 시작한다는 점을 기억!)
	// JPA는 내부적으로 오라클(inline view) 및 MySql or MariaDB(limit)를 구분하여 
	// -> 페이징 기법을 선택해줌 (JPA가 내부적으로 'Dialect'라는 존재로 이를 자동으로 처리)
	// SQL이 아닌 API의 객체와 메서드를 사용하는 형태로 페이징 처리 가능
	// findAll() 메서드를 사용 (JpaRepository 인터페이스의 상위인 PaingAndSortRepository의 메서드임)
	// -> 파라미터로 전달되는 Pageable이라는 타입의 객체에 의해 실행되는 쿼리를 결정 
	// ** 리턴 타입을 Page<T>타입으로 지정 -> 반드시 파라미터를 Pageable 타입을 이용
	// Pageable은 인터페이스이기 때문에 실제 객체 생성 시에는 PageRequest 라는 클래스를 사용
	// -> protected로 선언되어 new 생성자 사용 불가, static 한 of() 메서드를 통해 객체 생성!
	
	// @Test
	public void testPageDefault() {
		
		// 1페이지 10개 데이터 처리
		Pageable pageable = PageRequest.of(0, 10);
		
		// findAll()의 리턴타입이 Page, 해당 목록 가져오기 + 실제 페이지 처리에 필요한 전체 데이터의 개수를 가져오는 쿼리문도 처리
		// 만일 데이터가 충분하지 않다면 데이터의 개수를 가져오는 쿼리를 실행하지 않음
		Page<Memo> result = mr.findAll(pageable);
		
		System.out.println("result : " + result);
		
	}
	
	// Page 타입은 쿼리 결과를 사용하기 위한 여러 메서드를 지원
	// getTotalPages() : 총 몇 페이지, getTotalElements() : 전체 데이터 개수, getNumber() : 현재 페이지 번호 (0부터 시작)
	// getSize() : 페이지당 데이터 개수, hasNext() : 다음 페이지 존재 여부, isFirst() : 시작 페이지(0) 여부
	// @Test
	public void testPageDefault2() {
		
		// 1페이지 10개 데이터 처리
		Pageable pageable = PageRequest.of(0, 10);
		
		Page<Memo> result = mr.findAll(pageable);
		
		System.out.println("result : " + result);
		
		System.out.println("==============================");
		System.out.println("Total Pages    : " + result.getTotalPages());
		System.out.println("Total Count    : " + result.getTotalElements());
		System.out.println("Page Number    : " + result.getNumber());
		System.out.println("page Size      : " + result.getSize());
		System.out.println("has next page? : " + result.hasNext());
		System.out.println("first page?    : " + result.isFirst());
	}
	
	// 실제 페이지의 데이터 처리하는 코드 :  getContent() -> List<엔티티 타입>으로 처리 
	// Stream<엔티티 타입>을 반환하는 get() 
	// @Test
	public void testPageDefault3() {
		
		// 1페이지 10개 데이터 처리
		Pageable pageable = PageRequest.of(0, 10);
		
		Page<Memo> result = mr.findAll(pageable);
		
		System.out.println("==============================");
		for (Memo memo : result.getContent()) {
			System.out.println(memo);
		}

	}
	
	// 페이징 처리에 사용했던 PageRequest 클래스에는 Sort 타입을 파라미터로 전달 가능
	// Sort는 한 개 혹은 여러 개의 필드값을 이욯새 asc 또는 desc 지정 가능
	// Stream<엔티티 객체> 타입을 반환하는 get() 메서드 사용해서 실제 데이터 출력
	// @Test
	public void testSort() {
		
		Sort sort1 = Sort.by("mno").descending();
		Sort sort2 = Sort.by("memoText").ascending();
		// Sort 타입 메서드 and() 사용해서 연결
		Sort sortAll = sort1.and(sort2);
		
		Pageable pageable = PageRequest.of(0, 10, sortAll);
		
		Page<Memo> result = mr.findAll(pageable);
		
		result.get().forEach(memo -> {
			System.out.println(memo);
		});	
	}
	
	// Repository 인터페이스의 쿼리메서드 테스트
	// @Test
	public void testQueryMethods() {
		
		List<Memo> list = mr.findByMnoBetweenOrderByMnoDesc(70L, 80L);
		
		for (Memo memo : list) {
			System.out.println(memo);
		}
	}
	
	// 쿼리 메서드와 Pageable 결합 테스트
	// @Test
	public void testQueryMethodWithPageable() {
		
		Pageable pageable = PageRequest.of(0, 10, Sort.by("mno").descending());
		
		Page<Memo> result = mr.findByMnoBetween(10L, 50L, pageable);
		
		result.get().forEach(memo -> System.out.println(memo));
		
	}
	
	
	// 레파지토리 인터페이스의 삭제 테스트
	// delete 쿼리 메서드는 우선 select문으로 해당 엔티티 객체들을 가져오는 작업 + 각 엔티티 삭제하는 작업 같이 수행
	// @Transactional 없으면 삭제 불가
	// @Commit은 최종 결과를 커밋, 쿼리메서드 delete는 기본적으로 롤백 처리되어 commit 없으면 결과가 DB에 반영x
	// 엔티티 객체가 하나씩 하나씩 삭제되어 실제 개발자들은 사용 X -> @Query 이용하여 효율성 높임
	@Commit
	@Transactional
	// @Test
	public void testDeleteQueryMethods() {
		
		mr.deleteMemoByMnoLessThan(10L);
		
	}
	
	// 레파지토리 인터페이스의 @Query 어노테이션 테스트
	// @Test
	public void testGetListDesc() {
		
		List<Memo> list = mr.getListDesc();
		
		for (Memo memo : list) {
			System.out.println(memo);
		}
		
	}
	
	// @Query의 파라미터 바인딩 테스트
	// @modifying도 기본적으로 롤백이 되는 것인가 commit 어노테이션을 달아주면서 해결!
	@Commit
	@Transactional
	@Modifying
	// @Test
	public void testUpdateMemoText() {
		
		mr.updateMemoText(10L, "@Query 테스트");
	}
	
	// @Query + 페이징 처리 테스트
	// 인터페이스 파라미터 부분에 @Param 추가해주어서 해결
	// @Test
	public void testGetListWithQuery() {
		
		Pageable pageable = PageRequest.of(0, 10, Sort.by("mno"));
		
		Page<Memo> result = mr.getListWithQuery(50L, pageable);
		
		result.get().forEach(memo -> System.out.println(memo));
		
	}
	
	// @Query + Object[] 리턴
	// Object[] 배열이기 때문에 인덱스를 사용해서 toString을 오버라이딩 하는 것 처럼 출력해주었음
	// @Test
	public void testGetListWithQueryObject() {
		
		Pageable pageable = PageRequest.of(0, 10, Sort.by("mno"));
		
		Page<Object[]> result = mr.getListWithQueryObject(9L, pageable);
		
		for (Object[] memo : result.getContent()) {
			System.out.println("mno : " + memo[0] + ", memoText : " + memo[1] + 
								", CURRENT_DATE : " + memo[2]);
		}
		
	}
	
	// NativeSQL 처리 테스트
	// @Test
	public void testNativeResult(){
		
		List<Object[]> list = mr.getNativeResult();
		
		for (Object[] memo : list) {
			System.out.println("mno : " + memo[0] + ", memoText : " + memo[1]);
		}
	}
	
}
