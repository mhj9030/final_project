package com.final_project.community;

import java.util.List;
import java.util.Map;


public interface FreeService {
	public int insertFree(Free dto, String pathname); //자유게시판 게시물추가
	public List<Free> listFree(Map<String, Object> map); //자유게시판 게시물리스트
	public int dataCount(Map<String, Object> map); //총 자유게시판 게시물갯수
	public Free readFree(int frnum); // 자유게시판 게시물읽기
	public int updateHitCount(int frnum); // 자유게시판 게시물 조회수 
	public Free preReadFree(Map<String, Object> map); // 자유게시판 게시물이전글
	public Free nextReadFree(Map<String, Object> map); // 자유게시판 게시물다음글
	public int updateFree(Free dto, String pathname); // 자유게시판 게시물수정
	public int deleteFree(int frnum, String pathname, String mId); // 자유게시판 게시물 삭제
	
	public int insertLikeFree(Free dto); // 자유게시판 게시물좋아요추가
	public int countLikeFree(int frnum); // 자유게시판 게시물좋아요갯수
	
	public int insertReply(FreeReply dto); // 자유게시판 게시물 댓글추가
	public List<FreeReply> listReply(Map<String, Object> map); // 자유게시판 게시물 댓글 리스트
	public List<FreeReply> listReplyAnswer(int answer); // 댓글의 댓글 리스트
	public int replyDataCount(Map<String, Object> map); // 댓글 갯수
	public int replyCountAnswer(int answer); // 댓글의 댓글 갯수
	public int deleteReply(Map<String, Object> map);  // 댓글삭제
}
