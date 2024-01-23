package com.hj.home;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//������ ��Ʈ�� �� MVC �� �����ϴ� ������ �ϴ� WebMvcConfig Ŭ����
//�� ��Ʈ�ѷ� ��� �� ���� ���ҽ����� �ڵ鷯 ����� �� Ž���ϴ� ������ �Ѵ�
@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

//	@Value("${my.savepath}")
//	private String saveFolder;
	
//	@Value("${app.image-upload-dir.savepath}")
//	private String saveFolder2;
//	
//	@Value("${app.image-upload-dir2.savepath}")
//	private String saveFolder3;
	
	private static final String[] CLASSPATH_RESOURCE_LOCATIONS
	= {
			"classpath:/static/",
			"classpath:/templates/",
	};
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		//url mapping "/"�� �����ϸ� "/main/main"�� �̵�
		registry.addViewController("/").setViewName("forward:page/main");
	}
	
	//���� ���ҽ� �ڵ鷯 ����� �ϰ�, �� ���ҽ����� ��ġ�� ���� ��� ���� �Ű������� ������
		//�޼��带 �������̵��� Ž���ϴ� ������ �Ѵ�.
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	//   /static/ �Ǵ� /templates/ ����� resources�� ���� ���ҽ����� �ִٰ� �����Ǿ��ִ�.
		registry.addResourceHandler("/resources/**")
		.addResourceLocations(CLASSPATH_RESOURCE_LOCATIONS);
//		registry.addResourceHandler("/upload/**")
//				.addResourceLocations(saveFolder);
//		registry.addResourceHandler("/image/MemberUpload/**")
//				.addResourceLocations(saveFolder2);
//		registry.addResourceHandler("/image/Member/**")
//		.addResourceLocations(saveFolder3);

	}
	
}
