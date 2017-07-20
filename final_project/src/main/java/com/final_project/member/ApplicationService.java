package com.final_project.member;

import java.util.List;
import java.util.Map;

public interface ApplicationService {
	public Member memberList(Map<String, Object> map);
	public List<MemberDetail> academyList(Map<String, Object> map);
	public List<MemberDetail> projectList(Map<String, Object> map);
	public List<MemberDetail> careerList(Map<String, Object> map);
}