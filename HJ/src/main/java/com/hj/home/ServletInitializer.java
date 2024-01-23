package com.hj.home;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

//������ ��Ʈ ���� ��, war ������ �������� ���� �����ȴ�.
public class ServletInitializer extends SpringBootServletInitializer {
	
	//WAR ������ �����ϰ� �ܺ� ���� �����̳ʿ� �����Ͽ� ��������Ʈ ���ø����̼��� �����ϴ� ������ �ϴ� Ŭ����
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		//configure : SpringApplicationBuilder�� �̿��ϸ�, application.sources() �޼��带 �����
		//�ܺ� ���� �����̳ʿ��� ������ ������ ��Ʈ ���ø����̼��� �������ش�.
		return application.sources(HjApplication.class);
	}

}
