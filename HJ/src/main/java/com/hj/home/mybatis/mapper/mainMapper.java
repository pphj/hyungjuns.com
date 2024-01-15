package com.hj.home.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hj.home.DTO.Admin;
import com.hj.home.DTO.Board;
import com.hj.home.DTO.BoardReply;

@Mapper
public interface mainMapper {

	List<Board> getProjectList(HashMap<String, Integer> list);

	List<Board> getCsList(HashMap<String, Integer> list);

	List<Board> getCodingList(HashMap<String, Integer> list);

	List<Board> getStudyList(HashMap<String, Integer> list);
	
	int getProjectListCount();
	
	void setBoardViewUpdate(int num);

	int getCsListCount();

	int getCodingListCount();

	int getStudyListCount();
	
	Board getBoardDetail(int num);

	List<BoardReply> getReplyList(Map<String, Integer> map);

	int getReplyListCount(int boardNum);

	int replyInsert(BoardReply boardReply);

	int replyUpdate(BoardReply boardReply);

	int replyDelete(BoardReply boardReply);

	void updateReplyCount(int boardNum);

	void minusReplyCount(int boardNum);

	BoardReply checkWriter(HashMap<String, Object> map);

	BoardReply checkPass(HashMap<String, Object> map);

	void boardInsert(Board board);

	Admin adminId(String name);

	void reReplyInsert(BoardReply boardReply);

	void replySeqUpdate(BoardReply boardReply);

	int getCountDown(int num);

	int getCountUp(int num);

	int updateBoard(Board board);

	int deleteBoard(int boardNum);

	

}
