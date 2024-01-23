package com.hj.home.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.hj.home.DTO.Admin;
import com.hj.home.mybatis.mapper.mainMapper;

public class AdminLoginSuccessHandler implements AuthenticationSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginSuccessHandler.class);
	
	@Autowired
	private mainMapper dao;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		logger.info("AdminLoginSuceessHandler 성공, 아이디 : " + authentication.getName());
		
		Admin id = dao.adminId(authentication.getName());
		
		if (id != null) {
			String url = request.getContextPath() + "/page/main";
			response.sendRedirect(url);
		}
		
	}
}
