package com.final_project.member;

import java.util.List;

public interface MemberService {
	// 회원정보 가져오기
	public Member readMember(String userid);
	
	// 회원가입
	public void insertMember(Member dto) throws Exception;
	
	
	public int updateLastLogin(String mId);
	public int updateAuthority(Member dto);
	public List<Member> listAuthority(String mId);
}
