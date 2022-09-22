package com.yh2.db.async;

import java.util.concurrent.Executor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

// 클래스를 Bean에 등록하기 위한 어노테이션
// 스프링 컨테이너는 @Configuration이 붙어있는 클래스를 자동으로 Bean으로 등록 -> 해당 클래스 파싱 -> @Bean 붙은 메소드를 찾아 Bean 등록
@Configuration
@EnableAsync
public class AsyncConfig {
	
	//수동으로 해당 메소드를 Bean에 등록 (메소드 이름으로 Bean 이름이 결정)
	@Bean
	public Executor getAsyncExecutor() {
		ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
		executor.setCorePoolSize(10);
		executor.setMaxPoolSize(10);
		executor.setQueueCapacity(100);
		executor.setThreadNamePrefix("yh-pool-");
		executor.initialize();
		
		return executor;
	}
}

/*
 * @EnableAsync             : Spring Boot에게 메서드의 비동기 기능 활성화를 알림
 * ThreadPoolTaskExecutor   : 비동기로 호출하는 Thread에 대한 설정 준비
 * CorePoolSize             : 기본적으로 실행을 대기하고 있는 Thread의 개수
 * MaxPoolSize              : 동시 동작하는 최대 Thread의 개수
 * QueueCapacity            : MaxPoolSize를 초과하는 요청이 Thread 생성 요청 시 해당 내용을 Queue에 저장
 *                            -> Thread에 여유 자리가 발생하면 하나씩 꺼내 동작을 실시
 * ThreadNamePrefix         : Spring이 생성하는 스레드의 접두사를 지정*/