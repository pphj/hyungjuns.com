package com.hj.home;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//스프링 부트의 웹 MVC 를 구상하는 역할을 하는 WebMvcConfig 클래스
//뷰 컨트롤러 등록 및 정적 리소스들의 핸들러 등록을 해 탐색하는 역할을 한다
@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	private static final String[] CLASSPATH_RESOURCE_LOCATIONS
	= {
			"classpath:/static/",
			"classpath:/templates/",
	};
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		//url mapping "/"로 접속하면 "/page/main"으로 이동
		registry.addViewController("/").setViewName("forward:page/main");
	}
	
	//정적 리소스 핸들러 등록을 하고, 그 리소스들의 위치를 담은 상수 값을 매개변수로 가지는 메소드를 오버라이딩해 탐색
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	//   /static/ 또는 /templates/ 경로의 resources에 정적 리소스들이 있다고 설정되어있다.
		registry.addResourceHandler("/resources/**")
		.addResourceLocations(CLASSPATH_RESOURCE_LOCATIONS);

	}
	
}
