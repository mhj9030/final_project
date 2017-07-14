package com.final_project.community;

import java.util.List;
import java.util.Map;


public interface TipService {
	public int insertTip(Tip dto, String pathname); //꿀팁추가
	public List<Tip> listTip(Map<String, Object> map); //꿀팁리스트
	public int dataCount(Map<String, Object> map); //총 꿀팁갯수
	public Tip readTip(int jtnum); // 꿀팁읽기
	public int updateHitCount(int jtnum); // 꿀팁 조회수 
	public Tip preReadTip(Map<String, Object> map); // 꿀팁이전글
	public Tip nextReadTip(Map<String, Object> map); // 꿀팁다음글
	public int updateTip(Tip dto, String pathname); // 꿀팁수정
	public int deleteTip(int jtnum, String pathname, String mId); // 꿀팁 삭제
	
	public int insertLikeTip(Tip dto); // 꿀팁좋아요추가
	public int countLikeTip(int jtnum); // 꿀팁좋아요갯수
	
	public int insertReply(TipReply dto); // 꿀팁 댓글추가
	public List<TipReply> listReply(Map<String, Object> map); // 꿀팁 댓글 리스트
	public List<TipReply> listReplyAnswer(int answer); // 댓글의 댓글 리스트
	public int replyDataCount(Map<String, Object> map); // 댓글 갯수
	public int replyCountAnswer(int answer); // 댓글의 댓글 갯수
	public int deleteReply(Map<String, Object> map);  // 댓글삭제
}
