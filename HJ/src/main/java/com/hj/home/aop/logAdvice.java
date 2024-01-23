package com.hj.home.aop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class logAdvice {
private static final Logger logger = LoggerFactory.getLogger(logAdvice.class);
	
//LogAdvicd 클래스의 공통 메소드를 aop에서 Advice라고 한다
	public void beforeLog() {
		logger.info("[LogAdvice : 공통 메소드 입니다.]");
	}
}
