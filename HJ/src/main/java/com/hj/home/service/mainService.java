package com.hj.home.service;

import java.util.List;

import com.hj.home.DTO.Board;
import com.hj.home.DTO.BoardReply;

public interface mainService {

	List<Board> getProjectList(int page, int i);

	List<Board> getCsList(int page, int i);

	List<Board> getCodingList(int page, int i);

	List<Board> getStudyList(int page, int i);
	
	int getProjectListCount();

	void setBoardViewUpdate(int num);

	int getCsListCount();

	int getCodingListCount();

	int getStudyListCount();
	
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
	
	int updateBoard(Board board);
	
	int deleteBoard(int boardNum);


	

	
	
	
	

}
