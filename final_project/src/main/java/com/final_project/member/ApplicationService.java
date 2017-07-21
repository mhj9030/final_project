package com.final_project.member;

import java.util.List;
import java.util.Map;

public interface ApplicationService {
	// 보기
	public int listCount(Map<String, Object> map);
	public List<MemberDetail> list(Map<String, Object> map);
	public MemberDetail readResume(Map<String, Object> map);
	
	// 삭제
	public int delete(List<String> list);
	public int deleteList(List<MemberDetail> list);
	
	// 1단계 입력
	public Member memberList(Map<String, Object> map);
	public List<MemberDetail> academyList(Map<String, Object> map);
	public List<MemberDetail> projectList(Map<String, Object> map);
	public List<MemberDetail> careerList(Map<String, Object> map);
	
	// 1단계 저장
	public int insertOneDetails(MemberDetail dto, String pathname);
	public int insertOneCareer(List<MemberDetail> list, Map<String, Object> map);
	public int insertOneProject(List<MemberDetail> list, Map<String, Object> map);
	
	// 2단계 저장
}