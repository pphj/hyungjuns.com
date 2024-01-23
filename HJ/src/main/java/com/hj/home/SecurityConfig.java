package com.hj.home;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.hj.home.security.AdminAccessDeniedHandler;
import com.hj.home.security.AdminLoginFailHandler;
import com.hj.home.security.AdminLoginSuccessHandler;
import com.hj.home.security.AdminUserDetailService;

@EnableWebSecurity
@Configuration
public class SecurityConfig  {
	@Autowired
	private DataSource datasource;
	
	@Bean
	public SecurityFilterChain adminSecurityFilterChain(HttpSecurity http) throws Exception {
		http.authenticationProvider(adminAuthencationProvider());
		http.antMatcher("/page/**")
			.authorizeRequests(authorizeRequests -> authorizeRequests
					.antMatchers("/page/**").permitAll()
					.antMatchers("/resources/**").permitAll()
			)
			.formLogin(formLogin -> formLogin
	                .loginPage("/")
	                .loginProcessingUrl("/page/loginProcess")
	                .usernameParameter("id")
	                .passwordParameter("pw")
	                .successHandler(adminLoginSuccessHandler())
	                .failureHandler(adminLoginFailHandler())
	        )
	        .logout(logout -> logout
	                .logoutSuccessUrl("/page/main")
	                .logoutUrl("/page/logout")
	                .invalidateHttpSession(true)
	                .deleteCookies("JSESSION_ID")
	        );
	   
			http.exceptionHandling().accessDeniedHandler(adminAccessDeniedHandler());

			return http.build();
	}
	
	@Bean						//계정 인증
	public DaoAuthenticationProvider adminAuthencationProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(adminDetailService());
		provider.setPasswordEncoder(encodePassword());
		return provider;
	}
	   
	@Bean
	public PersistentTokenRepository tokenRepository() {
		JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
		jdbcTokenRepository.setDataSource(datasource);
		return jdbcTokenRepository;
	}
	
	
	
	@Bean
	public AdminAccessDeniedHandler adminAccessDeniedHandler() {		//관리자 접속 제한
		return new AdminAccessDeniedHandler();
	}
	
	
	@Bean
	public AuthenticationSuccessHandler adminLoginSuccessHandler() {	//관리자 로그인 성공
		return new AdminLoginSuccessHandler();
	}
	
	
	@Bean
	public AuthenticationFailureHandler adminLoginFailHandler() {	//관리자 로그인 실패
		return new AdminLoginFailHandler();
	}
	
	
	@Bean
	public UserDetailsService adminDetailService() {				//관리자 데이터
		return new AdminUserDetailService();
	}
	
	@Bean
	public BCryptPasswordEncoder encodePassword() {			//비밀번호 인코더
		return new BCryptPasswordEncoder();
	}
	
}
