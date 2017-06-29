package com.final_project.member;

public interface MemberService {
	// 회원정보 가져오기
	public Member readMember(String userid);
	
	// 회원가입
	public void insertMember(Member dto) throws Exception;
	
	

}
