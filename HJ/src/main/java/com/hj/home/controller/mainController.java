package com.hj.home.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value=".com")
public class mainController {
	private static final Logger logger = LoggerFactory.getLogger(mainController.class);

	
	
	@GetMapping(value="/main")							//메인 페이지
	public ModelAndView setMain(ModelAndView mv) {
		
		mv.setViewName("main/mainPage");
		return mv;
		
	}
	
	
	@GetMapping(value="/project")							//메인 페이지
	public ModelAndView setProject(ModelAndView mv) {
		
		mv.setViewName("project/project");
		return mv;
		
	}
	
	@GetMapping(value="/cs")							//메인 페이지
	public ModelAndView setCs(ModelAndView mv) {
		
		mv.setViewName("cs/cs");
		return mv;
		
	}
	
	@GetMapping(value="/coding")							//메인 페이지
	public ModelAndView setCoding(ModelAndView mv) {
		
		mv.setViewName("coding/coding");
		return mv;
		
	}
	
	@GetMapping(value="/study")							//메인 페이지
	public ModelAndView setStudy(ModelAndView mv) {
		
		mv.setViewName("study/study");
		return mv;
		
	}
	
}
