package com.final_project.community;

import java.util.List;
import java.util.Map;


public interface ReviewService {
	public int insertReview(Review dto); //뉴스추가
	public List<Review> listReview(Map<String, Object> map); //뉴스리스트
	public int dataCount(Map<String, Object> map); //총 뉴스갯수
	public Review readReview(int ibnum); // 뉴스읽기
	public int updateHitCount(int ibnum); // 뉴스 조회수 
	public Review preReadReview(Map<String, Object> map); // 뉴스이전글
	public Review nextReadReview(Map<String, Object> map); // 뉴스다음글
	public int updateReview(Review dto); // 뉴스수정
	public int deleteReview(int ibnum, String mId); // 뉴스 삭제
	
	public int insertLikeReview(Review dto); // 뉴스좋아요추가
	public int countLikeReview(int ibnum); // 뉴스좋아요갯수
	
	public int insertReply(ReviewReply dto); // 뉴스 댓글추가
	public List<ReviewReply> listReply(Map<String, Object> map); // 뉴스 댓글 리스트
	public List<ReviewReply> listReplyAnswer(int answer); // 댓글의 댓글 리스트
	public int replyDataCount(Map<String, Object> map); // 댓글 갯수
	public int replyCountAnswer(int answer); // 댓글의 댓글 갯수
	public int deleteReply(Map<String, Object> map);  // 댓글삭제
}
