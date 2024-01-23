package com.hj.home.aop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class logAdvice {
private static final Logger logger = LoggerFactory.getLogger(logAdvice.class);
	
//LogAdvicd Ŭ������ ���� �޼ҵ带 aop���� Advice��� �Ѵ�
	public void beforeLog() {
		logger.info("[LogAdvice : ���� �޼ҵ� �Դϴ�.]");
	}
}
