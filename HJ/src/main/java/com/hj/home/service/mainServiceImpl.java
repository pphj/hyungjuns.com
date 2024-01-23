package com.hj.home.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hj.home.DTO.Board;
import com.hj.home.DTO.BoardReply;
import com.hj.home.mybatis.mapper.mainMapper;

@Service
public class mainServiceImpl implements mainService {
	private mainMapper dao;
	
	@Autowired
	public mainServiceImpl(mainMapper dao) {
		this.dao = dao;
	}
	
	//리스트 공통 사용 메소드
	public HashMap<String, Integer> listLogic (int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		
		return map;
	}
	
	//검색 리스트 공통 메소드
	public Map<String, Object> listLogic_Search(int index, String search_word, int page, int limit, String[] searchField) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (index != -1) {
			map.put("search_field", searchField[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);

		return map;
	}
	
	@Override
	public List<Board> getProjectList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.getProjectList(list);
	}
	
	@Override
	public List<Board> getCsList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.getCsList(list);
	}

	@Override
	public List<Board> getCodingList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.getCodingList(list);
	}

	@Override
	public List<Board> getStudyList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.getStudyList(list);
	}

	@Override
	public int getProjectListCount() {
		return dao.getProjectListCount();
	}

	@Override
	public void setBoardViewUpdate(int num) {
		dao.setBoardViewUpdate(num);
	}

	@Override
	public int getCsListCount() {
		return dao.getCsListCount();
	}

	@Override
	public int getCodingListCount() {
		return dao.getCodingListCount();
	}

	@Override
	public int getStudyListCount() {
		return dao.getStudyListCount();
	}

	@Override
	public Board getBoardDetail(int num) {
		return dao.getBoardDetail(num);
	}

	@Override
	public List<BoardReply> getReplyList(int boardNum, int page) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int startrow = 1;
		int endrow = page * 5;
		
		map.put("boardNum", boardNum);
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getReplyList(map);
	}

	@Override
	public int getReplyListCount(int boardNum) {
		return dao.getReplyListCount(boardNum);
	}

	@Override
	public void replyInsertAndUpdateReplyCount(BoardReply boardReply, int replyCountNow) {
		boardReply.setReplyNum(replyCountNow + 1);
		dao.updateReplyCount(boardReply.getBoardNum());
        dao.replyInsert(boardReply);
	}

	@Override
	public int replyUpdate(BoardReply boardReply) {
		return dao.replyUpdate(boardReply);
	}

	@Override
	public void replyDeleteAndUpdateReplyCount(BoardReply boardReply) {
		dao.minusReplyCount(boardReply.getBoardNum());
		dao.replyDelete(boardReply);
	}

	@Override
	public boolean checkWriter(int replyNum, String replyWriter, String replyPass) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("replyNum", replyNum);
		map.put("replyWriter", replyWriter);
		map.put("replyPass", replyPass);
		
		BoardReply result = dao.checkWriter(map);
		
		if (result == null)
			return false;
		else
			return true;
	}

	@Override
	public boolean checkPass(int replyNum, int boardNum, String deletePass) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("replyNum", replyNum);
		map.put("boardNum", boardNum);
		map.put("deletePass", deletePass);
		
		BoardReply result = dao.checkPass(map);
		
		if (result == null)
			return false;
		else
			return true;
	}

	@Override
	public void boardinsert(Board board, int boardNumCountNow) {
		board.setBoardNum(boardNumCountNow + 1);
		dao.boardInsert(board);
	}
	
	
	@Override
	public void reReplyInsertAndUpdateReplyCount(BoardReply boardReply) {
		dao.updateReplyCount(boardReply.getBoardNum());
		dao.replySeqUpdate(boardReply);
		
		boardReply.setReplyLev(boardReply.getReplyLev() + 1);
		boardReply.setReplySeq(boardReply.getReplySeq() + 1);
		
        dao.reReplyInsert(boardReply);
	}

	@Override
	public int getProjectCountDown(int num) {		//각 게시판의 최대,최소 글 번호
		return dao.getProjectCountDown(num);
	}

	@Override
	public int getProjectCountUp(int num) {
		return dao.getProjectCountUp(num);
	}
	
	@Override
	public int getCsCountDown(int num) {
		return dao.getCsCountDown(num);
	}

	@Override
	public int getCsCountUp(int num) {
		return dao.getCsCountUp(num);
	}
	
	@Override
	public int getCodingCountDown(int num) {
		return dao.getCodingCountDown(num);
	}

	@Override
	public int getCodingCountUp(int num) {
		return dao.getCodingCountUp(num);
	}
	
	@Override
	public int getStudyCountDown(int num) {
		return dao.getStudyCountDown(num);
	}

	@Override
	public int getStudyCountUp(int num) {
		return dao.getStudyCountUp(num);
	}

	@Override
	public int updateBoard(Board board) {
		return dao.updateBoard(board);
	}

	@Override
	public int deleteBoard(int boardNum) {
		return dao.deleteBoard(boardNum);
	}

	@Override
	public int boardNumCountNow() {
		return dao.boardNumCountNow();
	}

	@Override
	public int replyCountNow() {
		return dao.replyCountNow();
	}

	
	
}
