package com.final_project.community;

import java.util.List;
import java.util.Map;


public interface PhotoService {
	public int insertPhoto(Photo dto, String pathname); //포토추가
	public List<Photo> listPhoto(Map<String, Object> map); //포토리스트
	public int dataCount(Map<String, Object> map); //총 포토갯수
	public Photo readPhoto(int ptnum); // 포토읽기
	public int updateHitCount(int ptnum); // 포토 조회수 
	public Photo preReadPhoto(Map<String, Object> map); // 포토이전글
	public Photo nextReadPhoto(Map<String, Object> map); // 포토다음글
	public int updatePhoto(Photo dto, String pathname); // 포토수정
	public int deletePhoto(int ptnum, String pathname, String mId); // 포토 삭제
	
	public int insertLikePhoto(Photo dto); // 포토좋아요추가
	public int countLikePhoto(int ptnum); // 포토좋아요갯수
	
	public int insertReply(PhotoReply dto); // 포토 댓글추가
	public List<PhotoReply> listReply(Map<String, Object> map); // 포토 댓글 리스트
	public List<PhotoReply> listReplyAnswer(int answer); // 댓글의 댓글 리스트
	public int replyDataCount(Map<String, Object> map); // 댓글 갯수
	public int replyCountAnswer(int answer); // 댓글의 댓글 갯수
	public int deleteReply(Map<String, Object> map);  // 댓글삭제
}
