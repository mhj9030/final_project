package com.final_project.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("member.applicationService")
public class ApplicationServiceImpl implements ApplicationService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public Member memberList(Map<String, Object> map) {
		Member dto = new Member();
		
		try {
			dto = dao.getReadData("applications.memberList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public List<MemberDetail> academyList(Map<String, Object> map) {
		List<MemberDetail> list = new ArrayList<>();
		
		try {
			list = dao.getListData("applications.academyList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<MemberDetail> projectList(Map<String, Object> map) {
		List<MemberDetail> list = new ArrayList<>();
		
		try {
			list = dao.getListData("applications.projectList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	@Override
	public List<MemberDetail> careerList(Map<String, Object> map) {
		List<MemberDetail> list = new ArrayList<>();
		
		try {
			list = dao.getListData("applications.careerList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
}
