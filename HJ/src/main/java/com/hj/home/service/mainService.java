package com.hj.home.service;

import java.util.List;

import com.hj.home.DTO.Board;
import com.hj.home.DTO.BoardReply;

public interface mainService {

	List<Board> getProjectList(int index, String search_word, int page, int i);

	List<Board> getProjectList(int page, int limit);

	int getProjectListCount();

	void setBoardViewUpdate(int num);

	int getCsListCount();

	List<Board> getCsList(int index, String search_word, int page, int i);

	List<Board> getCsList(int page, int limit);

	int getCodingListCount();

	List<Board> getCodingList(int index, String search_word, int page, int i);

	List<Board> getCodingList(int page, int limit);

	int getStudyListCount();

	List<Board> getStudyList(int index, String search_word, int page, int i);

	List<Board> getStudyList(int page, int limit);
	
	Board getBoardDetail(int num);

	List<BoardReply> getReplyList(int boardNum, int page);

	int getReplyListCount(int boardNum);

	void replyInsertAndUpdateReplyCount(BoardReply boardReply);

	int replyUpdate(BoardReply boardReply);
	
	void replyDeleteAndUpdateReplyCount(BoardReply boardReply);

	boolean checkWriter(int replyNum, String replyWriter, String replyPass);

	boolean checkPass(int replyNum, int boardNum, String deletePass);

	void boardinsert(Board board);

	void reReplyInsertAndUpdateReplyCount(BoardReply boardReply);

	int getCountDown(int num);

	int getCountUp(int num);

	int boardUpdate(Board board);
	
	
	

}
