package com.hj.home.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hj.home.DTO.Board;
import com.hj.home.DTO.BoardReply;
import com.hj.home.DTO.PaginationDTO;
import com.hj.home.service.mainService;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
@RequestMapping(value=".com")
public class mainController {
	private static final Logger logger = LoggerFactory.getLogger(mainController.class);
	
	private mainService mainService;
	
	@Autowired
	public mainController(mainService mainService) {
		this.mainService=mainService;
	}
	
	@GetMapping(value="/main")							//메인 페이지
	public ModelAndView setMain(ModelAndView mv) {
		
		mv.setViewName("main/mainPage");
		return mv;
		
	}
	
	public PaginationDTO calculatePagination (int page, int limit, int listCount) {	//페이징 처리
		PaginationDTO p = new PaginationDTO();
		
		p.setLimit(limit);
		p.setListCount(listCount);							//총 글의 수
		p.setMaxPage((listCount + limit -1) / limit);		//최대 페이지 수
		p.setStartPage(((page - 1) / 10) * 10 + 1);			//현재 페이지에 표시할 첫 페이지 수
		p.setEndPage(p.getStartPage() + 10 - 1);			//현재 페이지에 표시할 끝 페이지 수
		
		if (p.getEndPage() > p.getMaxPage()) {
			p.setEndPage(p.getMaxPage());
		}
		
		return p;
	}
	
	@GetMapping(value="/project")								//프로젝트 게시글 리스트
	public ModelAndView setProject(
			@RequestParam(value="page", defaultValue="1", required=false) int page, ModelAndView mv) {
		PaginationDTO p = calculatePagination(page, 10, mainService.getProjectListCount());
		
		List<Board> projectList = mainService.getProjectList(page, 10);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", p.getMaxPage());		
		mv.addObject("startpage", p.getStartPage());	
		mv.addObject("endpage", p.getEndPage());		
		mv.addObject("listcount", p.getListCount());
		mv.addObject("projectList", projectList);				//해당 페이지의 글 목록 리스트
		mv.addObject("limit", 10);
		mv.setViewName("project/project");
		return mv;
		
	}
	
	@GetMapping("/project/{num}")
	public ModelAndView projectDetail(
			@PathVariable("num") int num, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		if (beforeURL != null && beforeURL.endsWith("project")) {
			mainService.setBoardViewUpdate(num);
		}
		
		Board projectData = mainService.getBoardDetail(num);
		
		if (projectData == null) {
			logger.info("project 상세보기 실패");
			mv.addObject("url", request.getRequestURI());
		}else {
			logger.info("project 상세보기 성공");
			int countDown = mainService.getCountDown(num);
			int countUp = mainService.getCountUp(num);
			int count = mainService.getReplyListCount(num);
			
			mv.addObject("count", count);
			mv.addObject("projectData", projectData);
			mv.addObject("countDown", countDown);
			mv.addObject("countUp", countUp);
			mv.setViewName("detailView/projectView");
		}
		return mv;
	}
	
	@GetMapping(value="/cs")							//cs 공부
	public ModelAndView setCs(
			@RequestParam(value="page", defaultValue="1", required=false) int page, ModelAndView mv) {
		PaginationDTO p = calculatePagination(page, 10, mainService.getProjectListCount());
		
		List<Board> csList = mainService.getCsList(page, 10);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", p.getMaxPage());		
		mv.addObject("startpage", p.getStartPage());	
		mv.addObject("endpage", p.getEndPage());		
		mv.addObject("listcount", p.getListCount());
		mv.addObject("csList", csList);				//해당 페이지의 글 목록 리스트
		mv.addObject("limit", 10);
		mv.setViewName("cs/cs");
		return mv;
		
	}
	
	@GetMapping("/cs/{num}")
	public ModelAndView csDetail(
			@PathVariable("num") int num, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer : " + beforeURL);
		if (beforeURL != null && beforeURL.endsWith("cs")) {
			mainService.setBoardViewUpdate(num);
		}
		
		Board csData = mainService.getBoardDetail(num);
		
		if (csData == null) {
			logger.info("cs 상세보기 실패");
			mv.addObject("url", request.getRequestURI());
		}else {
			logger.info("cs 상세보기 성공");
			int countDown = mainService.getCountDown(num);
			int countUp = mainService.getCountUp(num);
			int count = mainService.getReplyListCount(num);
			
			mv.addObject("count", count);
			mv.addObject("csData", csData);
			mv.addObject("countDown", countDown);
			mv.addObject("countUp", countUp);
			mv.setViewName("detailView/csView");
		}
		return mv;
	}
	
	@GetMapping(value="/coding")						//코딩 풀이
	public ModelAndView setCoding(
			@RequestParam(value="page", defaultValue="1", required=false) int page, ModelAndView mv) {
		PaginationDTO p = calculatePagination(page, 10, mainService.getProjectListCount());
		
		List<Board> codingList = mainService.getCodingList(page, 10);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", p.getMaxPage());		
		mv.addObject("startpage", p.getStartPage());	
		mv.addObject("endpage", p.getEndPage());		
		mv.addObject("listcount", p.getListCount());
		mv.addObject("codingList", codingList);				//해당 페이지의 글 목록 리스트
		mv.addObject("limit", 10);
		mv.setViewName("coding/coding");
		return mv;
		
	}
	
	@GetMapping("/coding/{num}")
	public ModelAndView codingDetail(
			@PathVariable("num") int num, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer : " + beforeURL);
		if (beforeURL != null && beforeURL.endsWith("coding")) {
			mainService.setBoardViewUpdate(num);
		}
		
		Board codingData = mainService.getBoardDetail(num);
		if (codingData == null) {
			logger.info("coding 상세보기 실패");
			mv.addObject("url", request.getRequestURI());
		}else {
			logger.info("coding 상세보기 성공");
			mv.addObject("codingData", codingData);
			mv.setViewName("detailView/codingView");
		}
		return mv;
	}
	
	@GetMapping(value="/study")							//정처리 공부
	public ModelAndView setStudy(
			@RequestParam(value="page", defaultValue="1", required=false) int page, ModelAndView mv) {
		PaginationDTO p = calculatePagination(page, 10, mainService.getProjectListCount());
		
		List<Board> studyList = mainService.getStudyList(page, 10);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", p.getMaxPage());		
		mv.addObject("startpage", p.getStartPage());	
		mv.addObject("endpage", p.getEndPage());		
		mv.addObject("listcount", p.getListCount());
		mv.addObject("studyList", studyList);				//해당 페이지의 글 목록 리스트
		mv.addObject("limit", 10);
		mv.setViewName("study/study");
		return mv;
		
	}
	
	@GetMapping("/study/{num}")
	public ModelAndView studyDetail(
			@PathVariable("num") int num, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer : " + beforeURL);
		if (beforeURL != null && beforeURL.endsWith("study")) {
			mainService.setBoardViewUpdate(num);
		}
		
		Board studyData = mainService.getBoardDetail(num);
		if (studyData == null) {
			logger.info("study 상세보기 실패");
			mv.addObject("url", request.getRequestURI());
		}else {
			logger.info("study 상세보기 성공");
			mv.addObject("studyData", studyData);
			mv.setViewName("detailView/studyView");
		}
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value="/replyList")					//boardNum -> reply.js 의 data값과 맞춰줘야한다
	public Map<String, Object> qnaReplyList(int boardNum, int page) {
		List<BoardReply> list = mainService.getReplyList(boardNum, page);
		int listcount = mainService.getReplyListCount(boardNum);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("listcount", listcount);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/replyInsert")
	public int replyInsertAndUpdateReplyCount(BoardReply BoardReply) {			//댓글 등록
		try {
	        mainService.replyInsertAndUpdateReplyCount(BoardReply);
	        return 1; 				// 성공
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0; 				// 실패
	    }
	}
	
	@ResponseBody
	@RequestMapping(value="/replyUpdate")
	public int replyUpdate(BoardReply BoardReply, RedirectAttributes ra) {			//댓글 수정
		boolean checkResult = mainService.checkWriter(BoardReply.getReplyNum(),
				BoardReply.getReplyWriter(),BoardReply.getReplyPass());
		
		if (checkResult == true) {								//댓글 닉네임 비밀번호 일치시
			return mainService.replyUpdate(BoardReply);
		}else {
			return 0;
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/replyDelete")
	public int replyDeleteAndUpdateReplyCount(BoardReply BoardReply, RedirectAttributes ra) {		//댓글 삭제
		boolean checkPass = mainService.checkPass(BoardReply.getReplyNum(),
				BoardReply.getBoardNum(),BoardReply.getDeletePass());
		
		if (checkPass) {
	        mainService.replyDeleteAndUpdateReplyCount(BoardReply);
	        return 1;
	    }else {
	    	return 0;
	    }
		
	}
	
	@ResponseBody
	@RequestMapping(value="/reReplyInsert")
	public int reReplyInsertAndUpdateReplyCount(BoardReply BoardReply) {		//대댓글 등록
		try {
	        mainService.reReplyInsertAndUpdateReplyCount(BoardReply);
	        return 1; 				// 성공
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0; 				// 실패
	    }
	}
	
	
	@GetMapping("/write")
	public String writeBoard() {		//글쓰기 이동
		return "write/writeBoard";
	}
	
	
	@PostMapping(value="/boardInsert")
	public String boardInsert(Board board, HttpServletRequest request) throws Exception {		//게시글 등록
		mainService.boardinsert(board);
		
		logger.info(board.toString());
		
		return "redirect:main";
		
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login(ModelAndView mv, @CookieValue(value="saveid",
		required=false) Cookie readCookie, HttpSession session, Principal userPrincipal) {			//로그인
		
		if (readCookie != null) {
			logger.info("저장된 아이디 : " + userPrincipal.getName());				//로그인한 아이디값을 로그에 찍어봄
			mv.setViewName("redirect:/.com/main");
		}else {
			mv.setViewName("main/mainPage");
			mv.addObject("loginfail", session.getAttribute("loginfail"));		//loginfail을 mv에 저장해주고
			session.removeAttribute("loginfail");								//세션값은 삭제한다
		}
		
		return mv;
	}
	

	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {			//로그아웃
		session.invalidate();
		return "redirect:/.com/main";
	}
	
	
	@GetMapping("/updateBoard/{num}")
	public ModelAndView faqUpdateView(@PathVariable("num") int num, ModelAndView mv,
															HttpServletRequest request) {		//게시글 수정 이동
		Board board = mainService.getBoardDetail(num);
		
		if (board == null) {									//글 불러오기 실패시
			logger.info("글 수정 이동 실패");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "글 수정 이동 실패");
			return mv;
		}
		
		logger.info("글 수정 이동 성공");
		mv.addObject("board", board);
		mv.setViewName("write/updateBoard");
		return mv;
		
	}
	
	
	@PostMapping(value="/updateBoard")
	public String updateBoard(Board board, RedirectAttributes ra) throws Exception {			//게시글 수정
		int result = mainService.updateBoard(board);
		
		logger.info(board.toString());
		String url = "";
		
		if (result == 0) {
			logger.info("게시글 수정 실패");
			
			url = "error/error";
		}else {
			logger.info("게시글 수정 성공");
			
			url = "redirect:main";
		}
		
		return url;
		
	}
	
	
	@PostMapping(value="/deleteBoard")
	public String deleteBoard(@RequestParam int boardNum, Model mv, RedirectAttributes ra, HttpServletRequest request) {			//게시글 삭제
		int result = mainService.deleteBoard(boardNum);
		
		if (result == 0) {
			logger.info("게시글 삭제 실패");
			return "error/error";
		}
		logger.info("게시글 삭제 성공");
		ra.addFlashAttribute("result", "deleteSuccess");
		
		return "redirect:/.com/main";
	}
	
}
