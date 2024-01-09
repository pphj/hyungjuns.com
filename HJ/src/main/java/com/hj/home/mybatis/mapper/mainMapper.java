package com.hj.home.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hj.home.DTO.Board;
import com.hj.home.DTO.BoardReply;

@Mapper
public interface mainMapper {

	List<Board> getProjectList(HashMap<String, Integer> list);
	
	List<Board> getProjectList2(Map<String, Object> list);
	
	int getProjectListCount();
	
	void setBoardViewUpdate(int num);

	int getCsListCount();

	List<Board> getCsList(HashMap<String, Integer> list);

	List<Board> getCsList2(Map<String, Object> list);

	int getCodingListCount();

	List<Board> getCodingList(HashMap<String, Integer> list);

	List<Board> getCodingList2(Map<String, Object> list);

	int getStudyListCount();

	List<Board> getStudyList(HashMap<String, Integer> list);

	List<Board> getStudyList2(Map<String, Object> list);
	
	Board getBoardDetail(int num);

	List<BoardReply> getReplyList(Map<String, Integer> map);

	int getReplyListCount(int boardNum);

	int replyInsert(BoardReply boardReply);

	int replyUpdate(BoardReply boardReply);

	int replyDelete(BoardReply boardReply);

	void updateReplyCount(int boardNum);

	void minusReplyCount(int boardNum);

	BoardReply checkWriter(HashMap<String, Object> map);

	

}
