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
		logger.info("������ �α��ν� �Է��� ��: " + username);
	    Admin id = dao.adminId(username);

	    if (id == null) {
	    	throw new UsernameNotFoundException(
	    			"�α��� ���̵�: " + username + " ������ ������ ã�� �� �����ϴ�.");
	    }

	    return id;
	}

}
