package com.final_project.community;

import java.util.List;
import java.util.Map;


public interface ReviewService {
	public int insertReview(Review dto); //후기추가
	public List<Review> listReview(Map<String, Object> map); //후기리스트
	public List<Review> listReviewLike(Map<String, Object> map);//후기리스트 좋아요순
	public int dataCount(Map<String, Object> map); //총 후기갯수
	public Review readReview(int ibnum); // 후기읽기
	public int updateHitCount(int ibnum); // 후기 조회수 
	public Review preReadReview(Map<String, Object> map); // 후기이전글
	public Review nextReadReview(Map<String, Object> map); // 후기다음글
	public int updateReview(Review dto); // 후기수정
	public int deleteReview(int ibnum); // 후기 삭제
	
	public int insertLikeReview(Review dto); // 후기좋아요추가
	public int countLikeReview(int ibnum); // 후기좋아요갯수
	
	public int insertReply(ReviewReply dto); // 후기 댓글추가
	public List<ReviewReply> listReply(Map<String, Object> map); // 후기 댓글 리스트
	public List<ReviewReply> listReplyAnswer(int answer); // 댓글의 댓글 리스트
	public int replyDataCount(Map<String, Object> map); // 댓글 갯수
	public int replyCountAnswer(int answer); // 댓글의 댓글 갯수
	public int deleteReply(Map<String, Object> map);  // 댓글삭제
}
