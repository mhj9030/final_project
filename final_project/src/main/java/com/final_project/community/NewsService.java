package com.final_project.community;

import java.util.List;
import java.util.Map;


public interface NewsService {
	public int insertNews(News dto, String pathname); //뉴스추가
	public List<News> listNews(Map<String, Object> map); //뉴스리스트
	public int dataCount(Map<String, Object> map); //총 뉴스갯수
	public News readNews(int jbnum); // 뉴스읽기
	public int updateHitCount(int jbnum); // 뉴스 조회수 
	public News preReadNews(Map<String, Object> map); // 뉴스이전글
	public News nextReadNews(Map<String, Object> map); // 뉴스다음글
	public int updateNews(News dto, String pathname); // 뉴스수정
	public int deleteNews(int jbnum, String pathname, String mId); // 뉴스 삭제
	
	public int insertLikeNews(News dto); // 뉴스좋아요추가
	public int countLikeNews(int jbnum); // 뉴스좋아요갯수
	
	public int insertReply(NewsReply dto); // 뉴스 댓글추가
	public List<NewsReply> listReply(Map<String, Object> map); // 뉴스 댓글 리스트
	public List<NewsReply> listReplyAnswer(int answer); // 댓글의 댓글 리스트
	public int replyDataCount(Map<String, Object> map); // 댓글 갯수
	public int replyCountAnswer(int answer); // 댓글의 댓글 갯수
	public int deleteReply(Map<String, Object> map);  // 댓글삭제
	
	
	public List<News> listMainNews();
}
