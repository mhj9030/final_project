package com.final_project.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("member.memberSerivce")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private CommonDAO cDao;

	@Override
	public Member readMember(String userid) {
		Member dto = null;
		try {
			// 회원정보 삽입
			dto=cDao.getReadData("member.readMember", userid);
			
			
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertMember(Member dto) throws Exception {

		try {
			// 회원정보 삽입
			cDao.insertData("member.insertMember", dto);
			
			// 권한삽입
			dto.setAuthority("ROLE_USER");
			cDao.insertData("member.insertAuthority", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
	}
	
	@Override
	public int updateLastLogin(String userId) {
		int result=0;
		try {
			result=cDao.updateData("member.updateLastLogin", userId);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int updateAuthority(Member dto) {
		int result=0;
		try {
			result=cDao.updateData("member.updateAuthority", dto);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Member> listAuthority(String userId) {
		List<Member> list=null;
		try {
			list=cDao.getListData("member.listAuthority", userId);
		} catch (Exception e) {
		}
		return list;
	}

}
