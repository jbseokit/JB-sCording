package org.zerock.ex1.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.zerock.ex1.entity.Memo;

// Spring Data JPA 에서는 자동으로 생성되는 코드 getById(), save(), deleteById() 등을 이용하여 CRUD 및 페이징 처리 구현
// Entity Object 엔티티 객체들을 처리하는 '기능'을 가진 Repository (JpaRepository 인터페이스 상속 받음)
public interface MemoRepository extends JpaRepository<Memo, Long> {
	
	// 쿼리메서드 기능 : 메서드의 이름 자체가 쿼리의 구문으로 처리되는 기능, 리턴 타입 자유로움
	// @Query : SQL과 유사하게 인티티 클래스의 정보를 이용해서 쿼리를 작성하는 기능 (JPQL, 객체 지향 쿼리)
	// -> 특정 범위 객체 검색, like 연산, 여러 조건 쿼리문 등 복잡한 쿼리 수행 가능
	
	// 1. 쿼리 메서드(findBy, getBy로 시작, 필요한 필드 조건이나 And, Or, Between 등 키워드 이용)
	// -> select 하는 작업 : List 타입이나 배열 이용가능 / 파라미터에 Pageable 타입 넣는 경우 무조건 리턴 Page<E> 타입
	List<Memo> findByMnoBetweenOrderByMnoDesc(Long from, Long to);
	
	// 2. 쿼리 메서드와 Pageable 결합
	Page<Memo> findByMnoBetween(Long from, Long to, Pageable pageable);
	
	// 3. deleteBy로 시작하는 삭제 처리
	void deleteMemoByMnoLessThan(Long mno);
	
	// 4. @Query 사용, value는 JPQL(객체 지향 쿼리)라고 불리는 구문, DML 처리 기능
	// 객체지향 쿼리는 테이블 대신 엔티티 클래스 및 클래스에 선언된 필드를 이용하여 작성
	// JPQL은 SQL와 유사하여 실제 SQL의 함수들도 사용 가능 ex) avg(), count(), group by, order by 등
	@Query("select m from Memo m order by m.mno desc")
	List<Memo> getListDesc();
	
	// 5. @Query의 파라미터 바인딩
	// where 구문에서 자주 사용
	// ?1, ?2 처럼 파라미터의 순서를 이용, :xxx 처럼 파라미터의 이름을 활용, :#{} 과 같이 자바 빈 스타일을 이용
	@Transactional
	@Modifying
	@Query("update Memo m set m.memoText = :memoText where m.mno = :mno")
	void updateMemoText(@Param("mno") Long mno, @Param("memoText") String memoText);
	
	// 6. @Query + 페이징 처리
	// Pageable 타입의 파라미터를 적용 + 리턴 타입 Page<엔티티 타입> 지정 -> countQuery 속성으로 Pageable 타입 파람 전달
	@Query(value = "select m from Memo m where m.mno > :mno", 
		   countQuery = "select count(m) from Memo m where m.mno > :mno")
	Page<Memo> getListWithQuery(@Param("mno") Long mno, Pageable pageable);
	
	// 7. @Query -> Object[] 리턴
	// 쿼리 메서드의 경우 엔티티 타입의 데이터만 추출 가능 but, @Query 어노테이션은 현재 필요한 데이터만을 Object[]의 형태로
	// 선별적으로 추출 가능! ex) 엔티티 클래스 외 시간을 가져올 때 ! JPQL에서는 SYSDATE 사용 가능
	@Query(value = "select m.mno, m.memoText, CURRENT_DATE from Memo m where m.mno > :mno", 
			countQuery = "select count(m) from Memo m where m.mno > :mno")
	Page<Object[]> getListWithQueryObject(@Param("mno") Long mno, Pageable pageable);
	
	// 8. Native SQL 처리 (SQL 구문을 그대로 활용)
	// JPA가 DB에 독립적이라는 장점을 잃는 대신 JOIN 구문과 같은 복잡한 쿼리를 처리하기 위해 사용!
	@Query(value = "select * from tbl_memo where mno > 0", nativeQuery = true)
	List<Object[]> getNativeResult();
}
