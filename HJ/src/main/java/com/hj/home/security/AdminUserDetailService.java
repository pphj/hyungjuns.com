package com.hj.home.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.hj.home.DTO.Admin;
import com.hj.home.mybatis.mapper.mainMapper;

public class AdminUserDetailService implements UserDetailsService {
	private static final Logger logger = LoggerFactory.getLogger(AdminUserDetailService.class);

	@Autowired
	private mainMapper dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("관리자 로그인시 입력한 값: " + username);
	    Admin id = dao.adminId(username);

	    if (id == null) {
	    	throw new UsernameNotFoundException(
	    			"로그인 아이디: " + username + " 관리자 정보를 찾을 수 없습니다.");
	    }

	    return id;
	}

}
