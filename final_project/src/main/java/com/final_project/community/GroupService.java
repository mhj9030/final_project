package com.final_project.community;

import java.util.List;
import java.util.Map;


public interface GroupService {
	public int insertGroup(Group dto, String pathname);
	public List<Group> listGroup(Map<String, Object> map);
	public List<Group> listGroupPopul(Map<String, Object> map);
	public List<Group> tagListGroup(Map<String, Object> map);
	public List<Group> myList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int dataTagCount(Map<String, Object> map);
	public int insertTag(Map<String, Object> map);
	public int insertMember(Map<String, Object> map);
	public int createdLimit(Map<String, Object> map);
	public int groupNameCheck(Map<String, Object> map);
	public int readGroupNum();
	public List<GroupTag> tagList(int groupNum);
	public List<GroupTag> menuTag();
	public Group readGroup(Map<String, Object> map);
	public List<GroupMember> listGroupMember(Map<String, Object> map);
	public int updateGroup(Group dto, String pathname);
	public int deleteGroup(int groupNum, String pathname, String mId);
	public int maxGroupSeq();
	public int createGroupTable(int seq);
	public int deleteGroupTable(int seq);
	public int checkGroupMember(Map<String, Object> map);
	public int joinGroup(Map<String, Object> map);
	public int outGroup(Map<String, Object> map);
	
	
	public int maxGroupBoardSeq(Map<String, Object> map);
	public int insertGroupBoard(GroupBoard dto, String pathname); //그룹의 게시판 글쓰기
	public List<GroupBoard> listGroupBoard(Map<String, Object> map); //그룹의 게시판 리스트
	public int dataCountBoard(Map<String, Object> map); //총 그룹의 게시판갯수
	public GroupBoard readGroupBoard(Map<String, Object> map); // 그룹의 게시판읽기
	public int updateHitCount(Map<String, Object> map); // 그룹의 게시판 조회수 
	public GroupBoard preReadGroupBoard(Map<String, Object> map); // 그룹의 게시판이전글
	public GroupBoard nextReadGroupBoard(Map<String, Object> map); // 그룹의 게시판다음글
	public int updateGroupBoard(GroupBoard dto, String pathname); // 그룹의 게시판수정
	public int deleteGroupBoard(Map<String, Object> map, String pathname, String mId); // 그룹의 게시판 삭제
	
	public int insertLikeGroupBoard(GroupBoard dto); // 그룹의 게시판좋아요추가
	public int countLikeGroupBoard(Map<String, Object> map); // 그룹의 게시판좋아요갯수
	
	public int insertReply(GroupBoardReply dto); // 그룹의 게시판 댓글추가
	public List<GroupBoardReply> listReply(Map<String, Object> map); // 그룹의 게시판 댓글 리스트
	public List<GroupBoardReply> listReplyAnswer(Map<String, Object> map); // 댓글의 댓글 리스트
	public int replyDataCount(Map<String, Object> map); // 댓글 갯수
	public int replyCountAnswer(Map<String, Object> map); // 댓글의 댓글 갯수
	public int deleteReply(Map<String, Object> map);  // 댓글삭제
	
}
